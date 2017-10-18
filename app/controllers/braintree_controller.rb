class BraintreeController < ApplicationController
	include BraintreeHelper

  def new
    if current_user.address.present? && current_user.city.present? && current_user.state.present? && current_user.zip.present? && current_user.phone_number.present? && current_user.email != "example@gmail.com"
    	@client_token = Braintree::ClientToken.generate
    	@recipe = Recipe.find(params[:recipe_id])
    else
      redirect_to edit_user_path(current_user)
      flash[:danger] =  "Please fill up all the details before proceed to payment!"
    end
  end

  def checkout
  @recipe = Recipe.find(params[:recipe_id])
  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
  result = Braintree::Transaction.sale(
   :amount => price, #this is currently hardcoded
   :payment_method_nonce => nonce_from_the_client,
   :options => {
      :submit_for_settlement => true
    }
   )

	  if result.success?
	    redirect_to user_path(current_user), :flash => { :success => "Transaction successful!" }
	  else
	    redirect_to user_path(current_user), :flash => { :error => "Transaction failed. Please try again." }
	  end
	end
end
