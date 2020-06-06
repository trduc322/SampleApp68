class User < ApplicationRecord
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, :email, presence: true
	validates :email, length: {maximum: 255, message: "Max is 255"},
	 format: {with: VALID_EMAIL_REGEX}, uniqueness: true
	validate :check_length_name, if: ->{ name.present? }
	has_secure_password
	
	
	def check_length_name
		if name.size > 150
			errors.add :name, "length maximum is 150"
		end
	end
end
