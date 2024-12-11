class Courseclass < ActiveRecord
    belong_to course
    has_one user

    validates :name, presence: true
    validates :schedule, presence: true
    attribute :quantity
    attribute :delete_flag
end