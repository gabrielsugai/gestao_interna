class Api::V1::CompaniesController < Api::V1::ApiController
  def create
    @company = Company.create!(company_params)

    render json: @company, status: :created
  end

  private

  def company_params
    params.require(:company).permit(:name, :cnpj, :address, :corporate_name)
  end
end
