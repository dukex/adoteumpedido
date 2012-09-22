class CreateAdopts < ActiveRecord::Migration
  def change
    create_table :adopts do |t|
      t.integer :request_id
      t.integer :user_id
      t.string :resume
      t.text :description

      t.timestamps
    end
  end
end
