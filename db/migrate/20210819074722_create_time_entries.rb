class CreateTimeEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :time_entries do |t|
      t.string :comment
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
