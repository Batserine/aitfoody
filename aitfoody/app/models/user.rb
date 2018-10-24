class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role
  has_many :revarticles
  before_validation :assign_role
  def assign_role
    self.role = Role.find_by_name("User") if self.role.nil?
  end
  #-- CAN CAN CAN ---
  def admin?
    self.role.name == "Admin" if !self.role.blank?
  end
  def reviewer?
    self.role.name == "Reviewer" if !self.role.blank?
  end
  def ori_user?
    self.role.name == "User" if !self.role.blank?
  end

end
