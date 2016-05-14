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

    private

    def user_params
      params.require(:user).permit :email
    end

  end
end
