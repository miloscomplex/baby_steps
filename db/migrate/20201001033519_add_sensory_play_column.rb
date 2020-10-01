class AddSensoryPlayColumn < ActiveRecord::Migration
  def change
    add_column :logs, :sensory_play_time, :boolean
  end
end
