module CategoriesHelper
  def show_category(categories, time_entry)
    category = categories.find { |category| category.id == time_entry.category_id }
    category.nil? ? '-' : category.name
	end
end
