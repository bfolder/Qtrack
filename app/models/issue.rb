class Issue < ActiveRecord::Base
  attr_accessible :name, :content, :is_resolved, :priority
  validates :name, presence: true
  validates :content, presence: true
  belongs_to :project
  has_many :comments
  after_initialize :defaults
  accepts_nested_attributes_for :comments

private
  def defaults
    self.priority ||= 1 # Default priority is 1
    self.is_resolved ||= false # Not resolved by default
  end
end
