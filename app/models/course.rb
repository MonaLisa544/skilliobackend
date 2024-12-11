class Course < ApplicationRecord
    belongs_to :company
    validates :course_name, presence: true
    validates :description, presence: true
    validates :duration, presence: true
    validates :course_type, presence: true
    validates :registration_start_date, presence: true
    validates :registration_due_date, presence: true
    validates :start_date, presence: true
    attribute :delete_flag


end 