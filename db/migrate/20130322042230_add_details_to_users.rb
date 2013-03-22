class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dateofbirth, :string
    add_column :users, :location, :string
  end
end
