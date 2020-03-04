class ClientNotNull < ActiveRecord::Migration
  def change
    execute <<-SQL
      UPDATE users set client = 'f' where client is null;
    SQL

    change_column_default :users, :client, false
    change_column_null :users, :client, false
  end
end
