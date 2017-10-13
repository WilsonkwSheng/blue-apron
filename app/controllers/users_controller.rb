class UsersController < ApplicationController
	def index
 	end
 
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
 	end
 
 	private
 
 	def user_params
    params.require(:user).permit(:name, :email, :password, :address, :city, :state, :zip, :phone_number)
  end
end
