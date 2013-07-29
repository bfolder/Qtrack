class UsersController < ApplicationController
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @roles = Role.all
  end

  def update
    respond_to do |format|
      @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        format.html { redirect_to edit_user_path(@user), flash: { success: 'Account was successfully updated.' }}
        format.json { head :no_content }
      else
        @roles = Role.all
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
