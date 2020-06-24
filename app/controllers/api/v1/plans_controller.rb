module Api
  module V1
    class PlansController < ActionController::API
      def index
        @plans = Plan.all

        render json: @plans
      end

      def show
        @plan = Plan.find(params[:id])

        render json: @plan
      rescue ActiveRecord::RecordNotFound
        render status: :not_found, json: { error: 'Plano não encontrado.' }
      end
    end
  end
end
