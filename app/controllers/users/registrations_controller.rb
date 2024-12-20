class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionsFix
  respond_to :json

  private

  def respond_with(current_user, _opts = {})
    if resource.persisted?
      render json: {
        status: {code: 200, message: 'Signed up successfully.'},
        data: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
      }
    else
      render json: {
        status: {message: "User couldn't be created successfully. #{current_user.errors.full_messages.to_sentence}"}
      }, status: :unprocessable_entity
    end
  end

  def sign_up_params
    if params[:user][:user_role].in?(['teacher', 'admin'])
      params.require(:user).permit(:last_name, :first_name, :phone_number, :email, :user_role, :password, :password_confirmation, :company_id)
    else
      params.require(:user).permit(:last_name, :first_name, :phone_number, :email, :user_role, :password, :password_confirmation)
    end
  end
end


