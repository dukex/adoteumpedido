class AddResumeToFoi < ActiveRecord::Migration
  def change
    add_column :fois, :resume, :string
  end
end
