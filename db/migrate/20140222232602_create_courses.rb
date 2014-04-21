class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.integer :owner_id, null: false
      t.string :public_id, null: false
      t.boolean :active
      t.string :link
      t.string :status
      t.datetime :deleted_date
      t.timestamps
    end
  end
end
