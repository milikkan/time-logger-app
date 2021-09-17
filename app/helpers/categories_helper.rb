module CategoriesHelper
  def display_category(time_entry)
    time_entry.category.try(:name) || '-'
  end
end
