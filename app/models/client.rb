class Client < ActiveRecord::Base
  has_many :properties
  has_many :done_transactions

  accepts_nested_attributes_for :properties
  accepts_nested_attributes_for :done_transactions

  has_many :visits, dependent: :destroy
  accepts_nested_attributes_for :visits

  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks
end
