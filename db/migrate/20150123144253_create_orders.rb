class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

    	t.string :stripe_token
    	t.integer :user_id
    	t.integer :product_id
    	t.string :delivery_address

      	t.timestamps null: false
    end
  end
end
