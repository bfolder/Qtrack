class IssuesController < ApplicationController
  # GET /issues/1
  # GET /issues/1.json
  def show
    @issue = Issue.find(params[:id])

    # Send response
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @issue }
    end
  end

  # GET /issues/new
  # GET /issues/new.json
  def new
    # Create vanilla issue
    @issue = Issue.new

    # Assign project here
    #@project = ...

    # Send response
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @issue }
    end
  end

  # GET /issues/1/edit
  def edit
    # Find corresponding issue
    @issue = Issue.find(params[:id])
  end

  # POST /issues
  # POST /issues.json
  def create
    # Create new issue
    @issue = Issue.new(params[:issue])

    # Assign current user
    @issue.user = current_user

    # Assign project here
    #@issue.project =

    # Send response
    respond_to do |format|
      if @issue.save
        format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
        format.json { render json: @issue, status: :created, location: @issue }
      else
        format.html { render action: "new" }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /issues/1
  # PUT /issues/1.json
  def update
    @issue = Issue.find(params[:id])

    # Send response
    respond_to do |format|
      if @issue.update_attributes(params[:issue])
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    # Find corresponding issue
    @issue = Issue.find(params[:id])

    # Delete issue
    @issue.destroy

    # Send response
    respond_to do |format|
      format.html { redirect_to issues_url }
      format.json { head :no_content }
    end
  end
end
