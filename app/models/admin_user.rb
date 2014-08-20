class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_many :visits, dependent: :destroy
  accepts_nested_attributes_for :visits

  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks
end
