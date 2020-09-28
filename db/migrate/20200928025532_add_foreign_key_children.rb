class AddForeignKeyChildren < ActiveRecord::Migration
  def change
    add_column :children, :care_giver_id, :integer 
  end
end
