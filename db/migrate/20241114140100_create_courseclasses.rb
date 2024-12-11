class CreateCourseclasses < ActiveRecord::Migration[7.2]
    def change
        create_table :groups do |t|
            t.string :group_name
            t.string :schedule
            t.integer :quantity
            t.boolean :delete_flag
            t.references :course, null: false, foreign_key: {to_table: :courses}
            t.references :user, null: false, foreign_key: {to_table: :users}

            t.timestamps
        end
    end
end
