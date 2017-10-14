class AddImagesToRecipes < ActiveRecord::Migration[5.1]
	def change
		add_column :recipes, :images, :json
	end
end