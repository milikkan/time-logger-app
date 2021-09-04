module ApplicationHelper
	def generate_title(user)
    user.is_admin ? "Admin" : user.email
	end
end
