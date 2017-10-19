require 'rails_helper'

RSpec.feature "User signin and signout", type: :feature do
	describe "the signin process" do
		before :each do
			@user = User.create(name: "test", email: "example1@gmail.com", password: "123", address: "sungai mati", city: "kl", state: "kl", zip: "47400", phone_number: "999", first_name: "Kevin", last_name: "Sia")
		end

		it "signs me in" do
			visit sign_in_path
	    fill_in 'email', with: 'example1@gmail.com'
	    fill_in 'password', with: '123'
	    click_button 'Sign in'
	    expect(page).to have_content 'Signed in!'
		end
	end	
end