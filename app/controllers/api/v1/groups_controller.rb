class Api::V1::GroupsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_group, only: [:show, :update, :destroy] 
    # GET /api/v1/groups
    def index
        if current_user&.user_role == 'admin'
          @groups = Group.where(company_id: current_user.company_id)
          render json: GroupSerializer.new(@groups).serialized_json, status: :ok
        else
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
      end
  
    # GET /api/v1/groups/:id
    def show
      @group = Group.find(params[:id])
      render json: GroupSerializer.new(@group).serialized_json, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  
    # POST /api/v1/groups
    def create
      @group = Group.new(group_params)
      if @group.save
        render json: GroupSerializer.new(@group).serialized_json, status: :created
      else
        render json: { errors: @group.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/v1/groups/:id
    def update
      @group = Group.find(params[:id])
      if @group.update(group_params)
        render json: GroupSerializer.new(@group).serialized_json, status: :ok
      else
        render json: { errors: @group.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  
    # DELETE /api/v1/groups/:id
    def destroy
      @group = Group.find(params[:id])
      @group.destroy
      render json: { message: 'Group deleted successfully' }, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  
    private
  
    def group_params
      params.require(:group).permit(:group_name, :schedule, :quantity, :course_id, user_id)
    end
  end
  
        