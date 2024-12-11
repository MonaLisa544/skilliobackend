class Api::V1::RegistrantsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_registrant, only: [:show, :update, :destroy] 
    # GET /api/v1/registrants
    def index
        if current_user&.user_role == 'admin'
          @registrants = Registrant.where(company_id: current_user.company_id)
          render json: Registrantserializer.new(@registrants).serialized_json, status: :ok
        else
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
      end
  
    # GET /api/v1/registrants/:id
    def show
      @registrant = Registrant.find(params[:id])
      render json: Registrantserializer.new(@registrant).serialized_json, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  
    # POST /api/v1/Registrants
    def create
      @registrant = Registrant.new(registrant_params)
      if @Registrant.save
        render json: Registrantserializer.new(@registrant).serialized_json, status: :created
      else
        render json: { errors: @registrant.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/v1/registrants/:id
    def update
      @registrant = Registrant.find(params[:id])
      if @registrant.update(registrant_params)
        render json: Registrantserializer.new(@registrant).serialized_json, status: :ok
      else
        render json: { errors: @registrant.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  
    # DELETE /api/v1/Registrants/:id
    def destroy
      @registrant = Registrant.find(params[:id])
      @registrant.destroy
      render json: { message: 'Registrant deleted successfully' }, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  
    private
  
    def registrant_params
      params.require(:registrant).permit(:user_id, :course_id)
    end
  end
  
        