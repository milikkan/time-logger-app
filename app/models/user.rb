# email:string
# password_digest:string
#
# password:string virtual
# password_confirmation:string virtual
class User < ApplicationRecord
	has_secure_password

	validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}

	# TODO add password length validates
	# TODO add password presence
	# TODO add email distinct

	has_many :time_entries, dependent: :destroy
end