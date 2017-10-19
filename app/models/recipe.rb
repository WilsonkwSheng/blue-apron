class Recipe < ApplicationRecord
	belongs_to :user
	has_many :directions
	accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true
	has_many :ingredients
	accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
	mount_uploaders :images, ImageUploader
	self.per_page = 2
	validates :title, presence: true
	validates :description, presence: true
	validates :price, presence: true
	validates :images, presence: true
	default_scope { order(created_at: :desc) }

	def self.search(search)
		if search
			where("title ILIKE :search", search: "%#{search}%")
		else
			all
		end
	end
end
