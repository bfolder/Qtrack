class Comment < ActiveRecord::Base
  attr_accessible :content
  belongs_to :issue
  belongs_to :user
  validates :content, presence: true

  def self.create(params, current_user)
    @comment = Comment.new(params[:comment])
    @issue = Issue.find(params[:issue_id])

    # Assign comment to issue
    @comment.issue = @issue
    @comment.user = current_user
    @comment
  end
end
