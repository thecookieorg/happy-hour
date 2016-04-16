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
end
