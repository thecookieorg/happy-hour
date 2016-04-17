class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:email, :name, :gender, :age, :interest, :location, :facebook, :twitter, :instagram, :favourite_restaurant, :favourite_food, :how_often_do_you_order_food_online, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email, :name, :gender, :age, :interest, :location, :facebook, :twitter, :instagram, :favourite_restaurant, :favourite_food, :how_often_do_you_order_food_online, :password, :password_confirmation)
  end
end