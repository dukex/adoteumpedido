class RemoveOrgToFois < ActiveRecord::Migration
  def up
    remove_column :fois, :org
  end

  def down
    add_column :fois, :org, :string
  end
end
