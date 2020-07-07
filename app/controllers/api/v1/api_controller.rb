class Api::V1::ApiController < ActionController::API
  include AbstractController::Translation
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  rescue_from 'ActiveRecord::RecordNotFound' do |exception|
    render status: :not_found,
    json: {
      error: t('not_found',
                    model: exception.model.constantize.model_name.human)
    }
  end
end
