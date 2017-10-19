class ChangePriceInRecipeTableToFloatFromInteger < ActiveRecord::Migration[5.1]
  def change
    change_column :recipes, :price, :float
  end
end
