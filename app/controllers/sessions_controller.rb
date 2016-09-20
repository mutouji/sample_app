class SessionsController < ApplicationController
  #/signin or /sessions
  def new

  end

  #/sessions
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate( params[:session][:password] )
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
    end
  end

  #/signout or /sessions delete
  def destroy
    sign_out
    redirect_to root_path
  end
end
