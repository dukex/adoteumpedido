class CreateAuthorities < ActiveRecord::Migration
  def change
    create_table :authorities do |t|
      t.string :name
      t.string :url_name

      t.timestamps
    end
  end
end
