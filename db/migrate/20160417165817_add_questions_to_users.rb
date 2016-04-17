class AddQuestionsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :favourite_restaurant, :string
    add_column :users, :favourite_food, :string
    add_column :users, :how_often_do_you_order_food_online, :string
  end
end
