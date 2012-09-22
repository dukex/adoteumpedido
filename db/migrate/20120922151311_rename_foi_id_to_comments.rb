class RenameFoiIdToComments < ActiveRecord::Migration
  def change
    rename_column :comments, :foi_id, :request_id
  end
end
