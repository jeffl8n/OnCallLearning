class CreateCourseRevisions < ActiveRecord::Migration
  def change
    create_table  :course_revisions do |t|
      t.integer :course_id
      t.integer :course_revision_num, :default => 1
      t.boolean :share_comments, :default => false
      t.datetime :expire_dt
      t.boolean :processed, default: false, null: false
      t.timestamps
    end
  end
end
