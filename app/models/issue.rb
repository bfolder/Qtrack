class Issue < ActiveRecord::Base
  attr_accessible :name, :content, :is_resolved, :priority
  validates :name, presence: true
  validates :content, presence: true
  belongs_to :project
  belongs_to :user
  has_many :comments
  after_initialize :defaults
  accepts_nested_attributes_for :comments

  def resolved?
    is_resolved
  end

  def self.create(params, current_user)
    @issue = Issue.new(params[:issue])
    @issue.user = current_user
    @issue.project = Project.find(params[:project_id])
    @issue
  end

private
  def defaults
    self.priority ||= 1 # Default priority is 1
    self.is_resolved ||= false # Not resolved by default
  end
end
