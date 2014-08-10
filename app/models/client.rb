class Client < ActiveRecord::Base
  has_many :done_transactions
end
