class CourseSerializer
    include FastJsonapi::ObjectSerializer
    attributes :course_name, :description, :duration, :course_type, 
               :registration_start_date, :registration_due_date,
               :start_date, :delete_flag, :company_id
end

