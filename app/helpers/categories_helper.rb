module CategoriesHelper
  def show_category(time_entry)
    category = Category.where(["id = ?", time_entry.category_id])
    category.empty? ? '-' : category.last.name
	end
end
