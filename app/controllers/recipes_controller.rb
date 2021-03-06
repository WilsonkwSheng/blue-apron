class RecipesController < ApplicationController
	def index
		@recipe = Recipe.search(params[:title])
	end

	def new
		@recipe = Recipe.new
			2.times do
	    @recipe.directions.build
	    @recipe.ingredients.build
	  end
	end

	def create
		@recipe = Recipe.new(recipe_params)
		if @recipe.save
			redirect_to user_path(current_user)
			flash[:success] = "Successfully create recipe listing"
		else
			redirect_to user_path(current_user)
			flash[:notice] = "Fail to create recipe listing. Make sure the field is filled"
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
