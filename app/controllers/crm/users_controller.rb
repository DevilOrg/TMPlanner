module Crm
  class UsersController < BaseController

    def index
      @users = User.order id: :desc
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new user_params

      if @user.save
        redirect_to crm_users_url
      else
        render action: :new
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])

      if @user.update_attributes user_params
        redirect_to crm_users_url
      else
        render action: :edit
      end
    end

    def destroy
      User.find(params[:id]).destroy
      redirect_to crm_users_url
    end

    private

    def user_params
      params.require(:user).permit :email, :password
    end

  end
end
