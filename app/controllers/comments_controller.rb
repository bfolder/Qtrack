class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @issue = Issue.find(params[:issue_id])

    # Assign comment to issue
    @comment.issue = @issue
    @comment.user = current_user
    puts '-------------------------'
    puts @comment.user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @issue, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { redirect_to @issue, notice: 'Comment was not created.'}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @issue = @comment.issue
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @issue }
      format.json { head :no_content }
    end
  end
end
