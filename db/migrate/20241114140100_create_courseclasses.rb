class CreateCourseclasses < ActiveRecord::Migration[7.2]
    def change
        create_table :courseclasses do |t|
            t.string :name 
            t.string :schedule
            t.integer :quantity
            t.boolean :delete_flag
            t.references :course, null: false, foreign_key: {to_table: :courses}
            t.references :user, null: false, foreign_key: {to_table: :users}

            t.timestamps
        end
    end
end
