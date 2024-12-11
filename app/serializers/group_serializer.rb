class GroupSerializer
    include FastJsonapi::ObjectSerializer
    attributes :group_name, :schedule, :quantity, :user_id, :course_id
end
