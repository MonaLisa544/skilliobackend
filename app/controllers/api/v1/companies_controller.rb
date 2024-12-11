class Api::V1::CompaniesController < ApplicationController
    # GET /api/v1/companies
    def index
      @companies = Company.all
      render json: CompanySerializer.new(@companies).serialized_json, status: :ok
    end
  
    print('wefwefwef')
    # GET /api/v1/companies/:id
    def show
      @company = Company.find(params[:id])
      render json: CompanySerializer.new(@company).serialized_json, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  
    # POST /api/v1/companies
    def create
      @company = Company.new(company_params)
      if @company.save
        render json: CompanySerializer.new(@company).serialized_json, status: :created
      else
        render json: { errors: @company.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/v1/companies/:id
    def update
      @company = Company.find(params[:id])
      if @company.update(company_params)
        render json: CompanySerializer.new(@company).serialized_json, status: :ok
      else
        render json: { errors: @company.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  
    # DELETE /api/v1/companies/:id
    def destroy
      @company = Company.find(params[:id])
      @company.destroy
      render json: { message: 'Company deleted successfully' }, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  
    private
  
    def company_params
      params.require(:company).permit(:company_name, :company_register, :address, :company_email, :company_phone_number)
    end
  end
  
        