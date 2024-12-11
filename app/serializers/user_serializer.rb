class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :first_name, :last_name, :phone_number, :email, :user_role, :company_id
  belongs_to :company
end
