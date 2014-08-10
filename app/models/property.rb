class Property < ActiveRecord::Base

  belongs_to :owner
  belongs_to :neighborhood
  
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos

  has_many :done_transactions, dependent: :destroy
  
end
