class Api::V1::CoursesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_course, only: [:show, :update, :destroy] 
    # GET /api/v1/courses
    def index
        if current_user&.user_role == 'admin'
          @courses = Course.where(company_id: current_user.company_id)
          render json: CourseSerializer.new(@courses).serialized_json, status: :ok
        else
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
      end
  
    # GET /api/v1/courses/:id
    def show
      @course = Course.find(params[:id])
      render json: CourseSerializer.new(@course).serialized_json, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  
    # POST /api/v1/courses
    def create
      @course = Course.new(course_params)
      if @course.save
        render json: CourseSerializer.new(@course).serialized_json, status: :created
      else
        render json: { errors: @course.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/v1/courses/:id
    def update
      @course = Course.find(params[:id])
      if @course.update(course_params)
        render json: courseSerializer.new(@course).serialized_json, status: :ok
      else
        render json: { errors: @course.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  
    # DELETE /api/v1/courses/:id
    def destroy
      @course = Course.find(params[:id])
      @course.destroy
      render json: { message: 'course deleted successfully' }, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  
    private
  
    def course_params
      params.require(:course).permit(:course_name, :description, :duration, :type, 
            :registration_start_date, :registration_due_date, :start_date, 
            :company_id, :delete_flag)
    end
  end
  
        