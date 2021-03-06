class UsersController < ApplicationController
 	def new
 		@user = User.new
 	end
 
 	def create
 		@user = User.new(user_params)
 		if @user.save
 			session[:user_id] = @user.id
 			redirect_to user_path(@user)
 			flash[:success] = "Welcome!"
 		else
 			redirect_to sign_up_path
 			flash[:danger] = "Please fill in all the details!"
 		end
 	end

 	def show
 		@user = User.find(params[:id])
 		@recipes = Recipe.all.page(params[:page])#.order('created_at DESC')
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
    params.require(:user).permit(:name, :email, :first_name, :last_name, :password, :address, :city, :state, :zip, :phone_number)
  end
end
