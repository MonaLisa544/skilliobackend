class RegistrantSerializer
    include FastJsonapi::ObjectSerializer
    attributes :user_id, :course_id, :grade
end
