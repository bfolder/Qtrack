class UsersController < ApplicationController
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end
end
