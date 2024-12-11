class CreateCourses < ActiveRecord::Migration[7.2]
    def change 
        create_table :courses do |t|
            t.string :course_name
            t.string :description
            t.string :duration 
            t.string :course_type
            t.date :registration_start_date
            t.date :registration_due_date
            t.date :start_date 
            t.boolean :delete_flag
            t.references :company, null: false, foreign_key: {to_table: :companies}

            t.timestamps
        end
    end
end