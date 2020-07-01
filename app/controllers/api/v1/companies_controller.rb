module Api
  module V1
    class CompaniesController < ActionController::API
      def create
        @company = Company.new(params.require(:company).permit(:name, :cnpj, :address, :corporate_name))

        if @company.save
          render json: @company, status: :created
        else
          render json: { error: @company.errors.full_messages }, status: :unprocessable_entity
        end
      end
    end
  end
end
