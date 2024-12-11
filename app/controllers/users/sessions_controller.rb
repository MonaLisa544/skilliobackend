class Users::SessionsController < Devise::SessionsController
  include RackSessionsFix
  respond_to :json

  private
  def respond_with(current_user, _opts = {})
    render json: {
      status: { 
        code: 200, message: 'Logged in successfully.',
        data: { user: UserSerializer.new(current_user).serializable_hash[:data][:attributes] }
      }
    }, status: :ok
  end
  def respond_to_on_destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    render json: {:message => 'Logged out'}.to_json, status: 200
  end
end 


 