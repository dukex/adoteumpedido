class CreateFois < ActiveRecord::Migration
  def change
    create_table :fois do |t|
      t.text :description
      t.string :org
      t.text :observation

      t.timestamps
    end
  end
end
