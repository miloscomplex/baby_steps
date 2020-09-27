class CareGivers < ActiveRecord::Migration
  def change
    create_table :care_givers do |t|
      t.string :name
      t.string :email
    end
  end
end
