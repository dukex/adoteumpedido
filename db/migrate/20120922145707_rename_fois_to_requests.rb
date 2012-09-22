class RenameFoisToRequests < ActiveRecord::Migration
  def change
    rename_table :fois, :requests
  end
end
