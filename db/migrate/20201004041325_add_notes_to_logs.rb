class AddNotesToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :notes, :string
  end
end
