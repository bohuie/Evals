class AddClientToUsers < ActiveRecord::Migration
  def change
    add_column :users, :client, :boolean
  end
end
