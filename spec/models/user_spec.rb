require 'rails_helper'

RSpec.describe User, type: :model do
	before(:each) do
		@user = User.create(name: "test", email: "example@gmail.com", password: "123", address: "sungai mati", city: "kl", state: "kl", zip: "47400", phone_number: "999", first_name: "Kevin", last_name: "Sia")
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

	describe "password" do
		it "should not let a user be created without a password" do 
			@user.password = nil
			expect(@user).to_not be_valid
		end
	end

	describe "#full_name" do
		it "will check user have full name" do
			result = @user.full_name
			expect(result).to eq("Kevin Sia")
		end
	end
end
	