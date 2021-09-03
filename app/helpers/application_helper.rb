module ApplicationHelper
	def generate_title(user)
    user.is_admin ? "Administrator" : user.email
	end
end
