class AddOtherFieldsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :course_count, :integer, :default => 0
    add_column :users, :active, :boolean, :default => true
    add_column :users, :deleted_at, :datetime

    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

  end

  def self.down
    remove_column :users, :admin
    remove_column :users, :course_count
    remove_column :users, :active
    remove_column :users, :deleted_at
    remove_column :users, :first_name
    remove_column :users, :last_name
  end
end