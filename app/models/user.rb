class User < ApplicationRecord
	has_secure_password
	has_many :authentications, dependent: :destroy
	has_many :recipes, dependent: :destroy
	validates :name, presence: true
	validates :password_digest, presence: true
	validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
	validates :address, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true
	validates :phone_number, presence: true

	enum role: { :customer => 0, :admin => 1, :superadmin => 2 }
 
 	def self.create_with_auth_and_hash(authentication, auth_hash)
		user = self.create!(
		  name: auth_hash["extra"]["raw_info"]["name"],
		  email: auth_hash["extra"]["raw_info"]["email"],
		  password: SecureRandom.hex(4)
		)

		user.authentications << authentication
		return user
	end

		# grab fb_token to access Facebook for user data
	def fb_token
		x = self.authentications.find_by(provider: 'facebook')
		return x.token unless x.nil?
	end
end