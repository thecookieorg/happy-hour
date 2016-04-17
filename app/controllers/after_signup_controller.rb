class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :personal, :social, :food

  def update
    @user = current_user
    case step
    when :confirm_password
      @user.update_attributes(params[:user])
    end
    sign_in(@user, bypass: true) # needed for devise
    render_wizard @user
  end

  def show
    @user = current_user
    case step
    when :find_friends
      @friends = @user.find_friends
    end
    render_wizard
  end

  def finish_wizard_path
    user_dashboards_index_path
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :name, :gender, :age, :interest, :location, :facebook, :twitter, :instagram, :favourite_restaurant, :favourite_food, :how_often_do_you_order_food_online, :password, :password_confirmation)
  end

  #def finish_wizard_path(resource)
  #  user_path(current_user)
  #end
end
