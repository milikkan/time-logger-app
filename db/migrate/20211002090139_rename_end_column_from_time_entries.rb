class RenameEndColumnFromTimeEntries < ActiveRecord::Migration[6.1]
  def change
    rename_column :time_entries, :end, :stop
  end
end
