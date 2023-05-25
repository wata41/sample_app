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
      # => Success
      reset_session
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # => GET /users/:id
      # redirect_to user_path(@user)    # => GET /users/:id
      # redirect_to user_path(@user.id) # => GET /users/2
    else
      # => Failure
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end
    
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
