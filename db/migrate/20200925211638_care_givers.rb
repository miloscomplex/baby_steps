class CareGivers < ActiveRecord::Migration
  def change
    create_table :care_givers do |t|
      t.string :name
      t.string :user_name
      t.string :password 
    end
  end
end
