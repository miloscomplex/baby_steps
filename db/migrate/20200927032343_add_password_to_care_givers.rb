class AddPasswordToCareGivers < ActiveRecord::Migration
  def change
    add_column :care_givers, :password_digest, :string
  end
end
