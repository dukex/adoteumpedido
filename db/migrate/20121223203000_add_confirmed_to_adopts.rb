class AddConfirmedToAdopts < ActiveRecord::Migration
  def change
    add_column :adopts, :confirmed, :boolean
  end
end
