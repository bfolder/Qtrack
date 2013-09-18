class UsersController < ApplicationController
  load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @roles = Role.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        # Send email to new user
        UserMailer.welcome_email(@user, request).deliver

        format.html { redirect_to users_path, flash: { success: 'User was successfully created.' }}
        format.json { render json: @user, status: :created }
      else
        @roles = Role.all
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

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

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    # Find corresponding user
    @user = User.find(params[:id])

    # Delete user
    @user.destroy

    # Send response
    respond_to do |format|
      format.html { redirect_to users_url, flash: { success: 'User was successfully deleted.' } }
      format.json { head :no_content }
    end
  end
end
