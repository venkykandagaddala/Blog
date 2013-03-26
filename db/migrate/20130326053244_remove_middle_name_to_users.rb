class RemoveMiddleNameToUsers < ActiveRecord::Migration
  def up
	remove_column :users, :middlename
  end

  def down
	add_column :users, :middlename, :string
  end
end
