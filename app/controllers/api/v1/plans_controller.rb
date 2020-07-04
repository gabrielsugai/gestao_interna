class Api::V1::PlansController < ActionController::API
  def index
    @plans = Plan.all

    render json: @plans
  end

  def show
    @plan = Plan.find(params[:id])

    render json: @plan
  rescue ActiveRecord::RecordNotFound => e
    render status: :not_found,
           json: {
             error: I18n.t('controllers.api.v1.errors.not_found',
                           model: e.model.constantize.model_name.human)
           }
  end
end
