class CreateClassstudents < ActiveRecord::Migration[7.2]
    def change 
        create_table :registrants do |t|
            t.references :group, null: false, foreign_key: {to_table: :group}
            t.references :user, null: false, foreign_key: {to_table: :users}
            t.boolean :delete_flag
            t.integer :grade 
            t.timestamps
        end 
    end 
end

