class AddChildrenTable < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name
      t.string :birthdate
      t.string :gender
    end
  end
end
