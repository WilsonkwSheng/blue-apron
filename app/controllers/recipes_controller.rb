class RecipesController < ApplicationController
	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(recipe_params)
		if @recipe.save
			redirect_to user_path(current_user)
			flash[:success] = "Successfully create recipe listing"
		else
			render "new"
			flash[:notice] = "Fail to create recipe listing"
		end
	end

	def show
 		@recipe = Recipe.find(params[:id])
 	end

	private

	def recipe_params
		params.require(:recipe).permit(:title, :description, :price, :user_id)
	end
end
