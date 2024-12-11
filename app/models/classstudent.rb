class classstudent < ActiveRecord
    belong_to course
    belong_to user
    attribute :grade 
    attribute :delete_flag
end