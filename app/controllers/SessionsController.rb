class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(email: params[:email])
    # if user.present? && user.authenticate(params[:password])
    #   render plain: user.inspect
    # end
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully!'
    else
      flash[:error] = 'Invalid email or password provided!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "User logged out!"
  end
end