class User < ActiveRecord::Base
	has_many :orders
	before_save { self.email = email.downcase }

	NAME_CHECK = /\D+/i
	EMAIL_CHECK = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :first, presence: true, length: {maximum: 30}, format: { with: NAME_CHECK }
	validates :last, presence: true, length: {maximum: 30}, format: { with: NAME_CHECK }
	validates :email, presence: true, uniqueness: true, format: { with: EMAIL_CHECK }
	validates :street, presence: true
	validates :city, presence: true
	validates :zip, presence: true

	has_secure_password
end
