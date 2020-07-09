class Api::V1::BotUsageReportsController < Api::V1::ApiController
  rescue_from ArgumentError, with: :invalid_params

  def generate
    @bot = Bot.find_by!(token: params[:bot][:token])
    @start_date = parse_date
    return invalid_params('invalid date') if invalid_date

    @end_date = @start_date.end_of_month
    @plan = @bot.purchase.plan
    @bot_chats = @bot.chats.between(@start_date, @end_date)

    render status: :ok, json: usage_report
  end

  private

  def usage_report
    {
      month: @start_date.strftime('%Y-%m'),
      total_chats: total_chats,
      total_messages: total_messages,
      monthly_cost: monthly_cost
    }
  end

  def total_chats
    @bot_chats.count
  end

  def total_messages
    @bot_chats.pluck(:message_count).inject(0, :+)
  end

  def monthly_cost
    base_cost = @bot.purchase.price_when_bought
    base_cost += extra_chats_cost if exceeded_chat_limit
    base_cost += extra_messages_cost if exceeded_message_limit

    base_cost
  end

  def extra_chats_cost
    (total_chats - chat_limit) * @plan.extra_chat_price
  end

  def extra_messages_cost
    (total_messages - message_limit) * @plan.extra_message_price
  end

  def exceeded_chat_limit
    total_chats > chat_limit
  end

  def exceeded_message_limit
    total_messages > message_limit
  end

  def chat_limit
    @plan.limit_monthly_chat
  end

  def message_limit
    @plan.limit_monthly_messages
  end

  def parse_date
    params[:date] ? Date.parse(params[:date]).beginning_of_month : Time.zone.today
  end

  def invalid_date
    @start_date < @bot.created_at
  end

  def invalid_params(exception)
    render status: :unprocessable_entity, json: { error: exception }
  end
end
