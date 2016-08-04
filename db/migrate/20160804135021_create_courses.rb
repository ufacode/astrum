class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
