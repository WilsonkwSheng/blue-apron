require 'rails_helper'

RSpec.describe Recipe, type: :model do
	before(:each) do
		@user = User.create(name: "test", email: "example@gmail.com", password: "123", address: "sungai mati", city: "kl", state: "kl", zip: "47400", phone_number: "999", first_name: "Kevin", last_name: "Sia")
		@recipe = Recipe.create!(title: "cookie", description: "chocolate cookie", price: 123, user_id: @user.id, images: ["nasi_lemak.jpg"])
		@recipe_one = Recipe.create!(title: "burger", description: "McD", price: 9, user_id: @user.id, images: ["burger.jpg"])
		@recipe_two = Recipe.create!(title: "pizza", description: "Domino", price: 30, user_id: @user.id, images: ["pizza.jpg"])
		# @search = "cookie"
	end

	describe "create recipe" do
		it "should let a recipe be created with a proper title, description and price" do
			@recipe.title = "cooookiesss"
			@recipe.description = "strawberry cookies"
			@recipe.price = 10
			expect(@recipe).to be_valid
		end
	end

	describe "fail to create recipe" do
		it "should not let a recipe be created if missing field" do
			@recipe.title = nil
			@recipe.description = "example"
			@recipe.price = 10
			expect(@recipe).to_not be_valid
		end
	end

	describe "#search" do
		it "should equal to search argument" do
			expect(Recipe.all).to eq [@recipe_two, @recipe_one, @recipe]
			# expect(@recipe.title).to eq(@search)
		end
	end
end