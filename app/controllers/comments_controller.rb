class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: 'new' }
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
