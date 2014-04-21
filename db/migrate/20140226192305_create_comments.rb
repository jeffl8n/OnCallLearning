class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :review_cycle_id
      t.integer :review_id
      t.decimal :slide
      t.string :title
      t.string :body
      t.boolean :star
      t.integer :status
      t.integer :assigned_to_id
      t.timestamps
    end
  end
end
