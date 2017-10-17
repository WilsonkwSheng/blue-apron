require 'rails_helper'

RSpec.describe User, type: :model do
	before(:each) do
		@user = User.create!(name: "test", email: "example@gmail.com", password: "123", address: "sungai mati", city: "kl", state: "kl", zip: "47400", phone_number: "999")
	end

	describe "login" do
		it "should let a user be created with a proper email" do
			@user.email = "qwerty@gmail.com"
			expect(@user).to be_valid
		end
	end

	describe "validations" do
		it "should not let a user be created without an email address" do
			@user.email = nil
			expect(@user).to_not be_valid
		end
	end

	describe "email validations" do
		it "should not let a user be created without an email address" do
			@user.email = "weiufwe"
			expect(@user).to_not be_valid
		end
	end
end

