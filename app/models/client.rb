class Client < ActiveRecord::Base
  has_many :properties
  has_many :done_transactions

  accepts_nested_attributes_for :properties
  accepts_nested_attributes_for :done_transactions
end
