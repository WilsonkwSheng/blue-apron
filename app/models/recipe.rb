class Recipe < ApplicationRecord
	belongs_to :user
	has_many :directions
	accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true
	mount_uploaders :images, ImageUploader
end
