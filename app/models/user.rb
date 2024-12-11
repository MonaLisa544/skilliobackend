class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, 
         :registerable, :recoverable, 
         :validatable, 
         :jwt_authenticatable, jwt_revocation_strategy: self

  def jwt_payload
    super
  end


  belongs_to :company, optional: true
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :phone_number, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, length: {minimum: 8}, if: :password_required?
  validates :password_confirmation, presence: true, if: :password_required?
  validates :user_role, presence: true
  enum user_role: { student: 'student', admin: 'admin', teacher: 'teacher' }

  attr_accessor :skip_password_validation


  private
    def password_required?
      return false if skip_password_validation
      new_record? || password.present? || password_confirmation.present?
    end
end