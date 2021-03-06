class SessionsController < ApplicationController
	def new
 	end
 
 	def create
 		@user = User.find_by_email(params[:email])
 		if @user && @user.authenticate(params[:password])
			flash[:success] = "Signed in!"
			session[:user_id] = @user.id
			redirect_to @user
		else
			flash[:danger] = "Error"
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to sign_in_path
	end

	def create_from_omniauth
   auth_hash = request.env["omniauth.auth"] #returns data about the user in an authentication hash 
   authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)

   # if: previously already logged in with OAuth
   if authentication.user
     user = authentication.user
     authentication.update_token(auth_hash)
     @next = root_url
     @notice = "Signed in!"
   # else: user logs in with OAuth for the first time
   else
     user = User.create_with_auth_and_hash(authentication, auth_hash)
     # you are expected to have a path that leads to a page for editing user details
     @next = edit_user_path(user)
     @notice = "Please Fill In Your Email And Other Details To Get Started! (If You See example@gmail.com It Means Your Facebook Setting Do Not Allow To Share Email!)"
   end

   session[:user_id] = user.id
   redirect_to @next, :notice => @notice
 end
end
