class Company < ApplicationRecord

    #has_many :users, dependent: :destroy
    has_many :courses

    validates :company_name, presence: true
    validates :company_register, presence: true
    validates :company_phone_number, presence: true, uniqueness: true
    validates :company_email, presence: true, uniqueness: true
    validates :address, presence: true
    attribute :delete_flag

end 