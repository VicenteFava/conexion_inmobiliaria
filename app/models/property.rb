class Property < ActiveRecord::Base

  include Filterable

  belongs_to :client
  belongs_to :property_type
  belongs_to :neighborhood
  
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos

  has_many :done_transactions, dependent: :destroy
  accepts_nested_attributes_for :done_transactions

  has_many :visits, dependent: :destroy
  accepts_nested_attributes_for :visits

  has_attached_file :principal_photo, :styles => { :medium => "800x" },
                    #:convert_options => { :thumb => "-quality 92" }, 
                    #PROBAR DEPSUES CON FOTOS GRANDES
                    :url => "/assets/images/:id/:basename.:extension",  
                    :path => ":rails_root/public/assets/images/:id/:basename.:extension"  

  validates_attachment_presence :principal_photo
  validates_attachment_size :principal_photo, :less_than => 5.megabytes
  validates_attachment_content_type :principal_photo, :content_type => [ "image/jpg",
                                                               "image/jpeg",
                                                               "image/png",
                                                               "image/gif" ]

  before_create :generate_reference

  scope :visible, -> { where(visible: true) }
  scope :property_type, -> (type_id) { where("property_type_id = ?", type_id) }
  scope :neighborhood, -> (neighborhood_id) { where("neighborhood_id = ?", neighborhood_id) }
  scope :for_rent, -> { where(for_rent: true) }
  scope :for_season_rent, -> { where(for_season_rent: true) }
  scope :for_sale, -> { where(for_sale: true) }

  TRANSACTION_TYPES = {
    rent: '1',
    season_rent: '2',
    sale: '3'
  }
  
  def photo_url
     principal_photo.url(:medium)
  end

  def self.random
    properties = Property.order("RANDOM()").limit(9)
  end

  def self.search(search, page)
    if search
      properties = filter(search.slice(:property_type, :neighborhood)).visible
      properties = properties.for_rent        if search[:transaction_type] == TRANSACTION_TYPES[:rent]
      properties = properties.for_season_rent if search[:transaction_type] == TRANSACTION_TYPES[:season_rent]
      properties = properties.for_sale        if search[:transaction_type] == TRANSACTION_TYPES[:sale]
      properties.paginate(:page => page)
    else
      visible.paginate(:page => page)
    end
  end

  private

  def generate_reference
    chars = 'ABCDEFGHJKLMNOPQRSTUVWXYZ0123456789'
    self.reference = loop do
      random_reference = '#'
      5.times { |i| random_reference << chars[rand(chars.length)] }
      break random_reference unless self.class.exists?(reference: random_reference)
    end
  end

  
end
