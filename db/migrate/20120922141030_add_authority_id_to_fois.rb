class AddAuthorityIdToFois < ActiveRecord::Migration
  def change
    add_column :fois, :authority_id, :integer
  end
end
