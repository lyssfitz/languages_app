class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.references :user, foreign_key: true
      t.references :language, foreign_key: true
      t.date :lesson_date
      t.time :lesson_time
      t.string :street
      t.string :city
      t.string :state
      t.string :postcode
      t.string :country
      t.text :body
      t.integer :price
      t.integer :max_students
      t.integer :difficulty
      t.boolean :cancelled

      t.timestamps
    end
  end
end
