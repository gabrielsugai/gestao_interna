module Api
  module V1
    class CompaniesController < ActionController::API
      def create
        @company = Company.new(params.permit(:name, :cnpj, :address, :corporate_name))
        @company.token = 'ABC123'

        if @company.save
          render json: @company, status: :created
        else
          render status: :not_acceptable, json: { error: @company.errors.full_messages }
        end
      end
    end
  end
end
