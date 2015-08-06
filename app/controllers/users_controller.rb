class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    respond_to do |format|
      if @user.save
        format.js { flash.now[:notice] = "Created Successfully" }
      else
        format.js { render action: "new" }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit('email', 'password', 'password_confirmation')
  end
end
