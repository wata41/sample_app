class UsersController < ApplicationController

    # GET /users/:id
  def show
    # @user = User.first
    @user = User.find(params[:id])
      # => GET app/views/users/new.html.erb
  end

  # GET /users/new
  def new
      # => GET app/views/users/new.html.erb
  end
end
