class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :role_id

  has_many :issues
  has_many :comments
  belongs_to :role

  accepts_nested_attributes_for :role, allow_destroy: false
  after_initialize :defaults

  def is_admin?
    role == Role.find_by_name('Admin')
  end

  def is_user?
    role == Role.find_by_name('User')
  end

  def update_attributes(attributes, options = {})
    if attributes[:password].blank? && attributes[:password_confirmation].blank?
      attributes.delete(:password)
      attributes.delete(:password_confirmation)
    end

    super(attributes, options)
  end

private
  def defaults
    self.role ||= Role.find_by_name('User')
  end
end
