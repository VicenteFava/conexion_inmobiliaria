class DoneTransaction < ActiveRecord::Base

  belongs_to :property
  belongs_to :client


  validates :property_id, presence: true
  validates :transaction_type, presence: true
end
