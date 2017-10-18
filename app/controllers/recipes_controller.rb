class RecipesController < ApplicationController
	def index
		@recipe = Recipe.search(params[:title])
	end

	def new
		@recipe = Recipe.new
			7.times do
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

 	def edit
 		@recipe = Recipe.find(params[:id])
 	end

 	def update
 		@recipe = Recipe.find(params[:id])
		if recipe_params
			@recipe.update(recipe_params)
			redirect_to user_path(current_user)
			flash[:success] = "Successfully updated the list"
		else
			render "edit"
			flash[:danger] = "Fail to update the list"
		end
 	end

 	def destroy
 		@recipe = Recipe.find(params[:id])
 		@recipe.destroy
 		respond_to do |format|
 			format.html { redirect_to user_path(current_user) }
 			format.js { render :layout => false }
 		end
 		# @recipe = Recipe.find(params[:id])
		# @recipe.destroy
		# redirect_to user_path(current_user)
		# flash[:success] = "Successfully deleted the list"
 	end

	private

	def recipe_params
		params.require(:recipe).permit(:title, :description, :price, :user_id, {images: []},directions_attributes: [:id, :step, :_destroy], ingredients_attributes: [:id, :name, :_destroy])
	end
end
