class DoneTransaction < ActiveRecord::Base

  belongs_to :property
  belongs_to :client

  validates :transaction_type, presence: true
end
