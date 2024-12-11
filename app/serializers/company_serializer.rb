class CompanySerializer
    include FastJsonapi::ObjectSerializer
    attributes :company_name, :company_register, :address, :company_email, :company_phone_number, :delete_flag
end