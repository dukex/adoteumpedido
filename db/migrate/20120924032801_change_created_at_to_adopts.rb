class ChangeCreatedAtToAdopts < ActiveRecord::Migration
  def change
    change_column :adopts, :created_at, :date
  end
end
