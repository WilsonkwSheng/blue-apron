class Recipe < ApplicationRecord
	belongs_to :user
	mount_uploader :images, AvatarUploader
end
