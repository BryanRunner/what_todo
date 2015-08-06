class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    respond_to do |format|
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        format.js { flash.now[:notice] = "Logged In" }
      else
        format.js { render action: "new" }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    respond_to do |format|
      format.js { flash.now[:notice] = "Logged Out" }
    end
  end
end
