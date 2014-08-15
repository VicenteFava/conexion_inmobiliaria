class Client < ActiveRecord::Base
  has_many :done_transactions
  has_many :done_transactions

  accepts_nested_attributes_for :properties
end
