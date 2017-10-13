class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    	t.string :name
     	t.string :encrypted_password
     	t.string :email
     	t.string :address
     	t.string :city
     	t.string :state
     	t.string :zip
     	t.string :phone_number
      t.timestamps
    end
  end
end
