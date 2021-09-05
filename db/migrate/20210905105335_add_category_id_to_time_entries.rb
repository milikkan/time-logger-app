class AddCategoryIdToTimeEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :time_entries, :category_id, :integer
  end
end
