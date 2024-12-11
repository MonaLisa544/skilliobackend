class CreateCompanies < ActiveRecord::Migration[7.2]
    def change
        create_table :companies do |t|
            t.string :company_name
            t.string :company_register
            t.string :address
            t.integer :company_phone_number
            t.string :company_email 
            t.boolean :delete_flag, default: false

            t.timestamps
        end
    end
end