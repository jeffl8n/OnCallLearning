class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :course_id
      t.integer :course_revision_id
      t.string :email
      t.string :secret_key
      t.integer :cycle_num
      t.datetime :lock_dt
      t.datetime :complete_dt
      t.timestamps
    end
  end
end
