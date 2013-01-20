class AddAlavateliToAdopts < ActiveRecord::Migration
  def change
    add_column :adopts, :alavateli_link, :string
  end
end
