class AddLogTable < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :child_id
      t.string :first_nap_time
      t.string :first_nap_duration
      t.string :second_nap_time
      t.string :second_nap_duration
      t.integer :wet_diapers
      t.integer :solied_diapers
      t.string :first_feeding
      t.string :second_feeding
      t.string :third_feeding
      t.boolean :art_and_crafts
      t.boolean :gym_time
      t.boolean :independent_play_time
      t.boolean :music_time
      t.boolean :story_time
      t.boolean :tummy_time
    end
  end
end
