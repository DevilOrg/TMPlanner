class Auth::SessionsController < ApplicationController

  def new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to '/'
    else
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to '/'
  end

end