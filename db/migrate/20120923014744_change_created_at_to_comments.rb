class ChangeCreatedAtToComments < ActiveRecord::Migration
  def change
    change_column :comments, :created_at, :date
  end
end
