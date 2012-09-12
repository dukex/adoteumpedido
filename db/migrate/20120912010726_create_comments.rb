class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.reference :foi

      t.timestamps
    end
  end
end
