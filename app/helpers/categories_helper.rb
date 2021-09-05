module CategoriesHelper
	def show_category(categories, time_entry)
    category_name = '-'
    categories.each do |category|
      if category.id == time_entry.category_id
        category_name = category.name
      end
    end
    category_name
	end
end
