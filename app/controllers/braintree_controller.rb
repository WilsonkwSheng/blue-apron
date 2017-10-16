class BraintreeController < ApplicationController
	include BraintreeHelper

  def new
  	@client_token = Braintree::ClientToken.generate
  	@recipe = Recipe.find(params[:recipe_id])
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
