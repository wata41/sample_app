class UsersController < ApplicationController

    # GET /users/:id
  def show
    # @user = User.first
    @user = User.find(params[:id])
      # => GET app/views/users/new.html.erb
  end

  # GET /users/new
  def new
    @user = User.new
      # => GET app/views/users/new.html.erb
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # 保存の成功をここで扱う。
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
