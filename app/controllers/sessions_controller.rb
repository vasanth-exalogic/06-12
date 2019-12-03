class SessionsController < ApplicationController

  def new
  end

  def create
    @error
    user = User.find_by_email(userparams[:email])
    if user && user.authenticate(userparams[:password])
      session[:type]=user.role
      if user.role=='admin'
        redirect_to '/users'
      else
        session[:id]=user.id
        redirect_to user
      end
    else
      @error = "invalid credentials"
      render 'new'
    end
  end

  def destroy
    session[:type]=nil
    render 'new'
  end

  private

  def userparams
    params.require(:user).permit(:email, :password, :role)
  end

  def is_admin?
    unless session[:type]=='admin'
      redirect_to root_path
    end
  end

end
