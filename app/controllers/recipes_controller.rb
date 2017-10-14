class RecipesController < ApplicationController
	def new
		@recipe = Recipe.new
			3.times do
	    recipe = @recipe.directions.build
	    recipe = @recipe.ingredients.build
	  end
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
		params.require(:recipe).permit(:title, :description, :price, :user_id, {images: []},directions_attributes: [:id, :step, :_destroy], ingredients_attributes: [:id, :name, :_destroy])
	end
end
