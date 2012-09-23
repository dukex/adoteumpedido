class ChangeCreatedAtToRequest < ActiveRecord::Migration
  def change
    change_column :requests, :created_at, :date
  end
end
