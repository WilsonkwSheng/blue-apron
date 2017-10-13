class UsersController < ApplicationController
 	def new
 		@user = User.new
 	end
 
 	def create
 		@user = User.new(user_params)
 		if @user.save
 			redirect_to user_path(@user)
 			flash[:success] = "Created the User!"
 		else
 			render "new"
 			flash[:notice] = "Didnt work"
 		end
 	end

 	def show
 		@user = User.find(params[:id])
 		@recipes = Recipe.all
 	end

 	def edit
     @user = User.find(params[:id])
  end
 
 	def update
 		@user = User.find(params[:id])
 		params[:user].delete(:password) if params[:user][:password].blank?
 		@user.update(user_params)
 		redirect_to user_path
 	end
 
 	private
 
 	def user_params
    params.require(:user).permit(:name, :email, :password, :address, :city, :state, :zip, :phone_number)
  end
end
