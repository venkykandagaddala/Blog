class AddMoreFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :text
    add_column :users, :email, :string
    add_column :users, :primaryphoneno, :integer
    add_column :users, :secondaryphoneno, :integer
  end
end
