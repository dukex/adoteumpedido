class AddStatusAndWaitingTokenToAdopts < ActiveRecord::Migration
  def change
    add_column :adopts, :status, :integer, default: 0
    add_column :adopts, :waiting_token, :string
  end
end
