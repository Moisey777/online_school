class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|

    	t.string :name
      t.text :description
      t.integer :position
      t.references :course, foreign_key: true
      t.index ["position"], name: "index_lessons_position"

      t.timestamps
    end
  end
end
