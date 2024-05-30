class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user != nil
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = You are now logged in."
        redirect_to "/places"
      else
        flash["notice"] = "Please try again."
        redirect_to "/login"
      end
    else
      flash["notice"] = "Please try again."
      redirect_to "/login"
    end
  end

  def destroy
    flash["notice"] = "You are now logged out."
    session["user_id"] = nil
    redirect_to "/login"
  end
end
  