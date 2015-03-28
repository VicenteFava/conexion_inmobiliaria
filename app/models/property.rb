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

  has_attached_file :principal_photo, :styles => { :medium => '800x' },
                    :url => '/assets/images/:id/:basename.:extension',  
                    :path => ':rails_root/public/assets/images/:id/:basename.:extension'  

  validates_attachment_presence :principal_photo
  validates_attachment_size :principal_photo, :less_than => 5.megabytes
  validates_attachment_content_type :principal_photo, :content_type => [ 'image/jpg',
                                                               'image/jpeg',
                                                               'image/png',
                                                               'image/gif' ]

  validates :reference, presence: true

  before_create :generate_reference

  # !!!!!!!!!!!!!!!!!!
  #crear indices para estas consultas
  # !!!!!!!!!!!!!!!!!!
  scope :visible, -> { where(visible: true) }
  scope :property_type, -> (type_id) { where('property_type_id = ?', type_id) }
  scope :neighborhood, -> (neighborhood_id) { where('neighborhood_id = ?', neighborhood_id) }
  scope :price_lower_or_equal, -> (price) { where('price <= ?', price) }
  scope :price_greater_or_equal, -> (price) { where('price >= ?', price) }
  scope :for_rent, -> { where(for_rent: true) }
  scope :for_season_rent, -> { where(for_season_rent: true) }
  scope :for_sale, -> { where(for_sale: true) }

  TRANSACTION_TYPES = {
    rent: '1',
    season_rent: '2',
    sale: '3'
  }

  PRICE_TYPES_RENT = {
    lower: '1',
    greater: '2'
  }

  PRICE_RANGE_RENT = {
    price: 20000
  }

  PRICE_TYPES_SALE = {
    lower: '1',
    middle: '2',
    greater: '3'
  }

  PRICE_RANGE_SALE = {
    low_price: 200000,
    high_price: 500000,
  }
  
  def photo_url
     principal_photo.url(:medium)
  end

  def transaction_types
    types = []
    types << 'Alquiler'if self.for_rent
    types << 'Alquiler de temporada'if self.for_season_rent
    types << 'Venta'if self.for_sale
    sentece = types.to_sentence(two_words_connector: ' y ', last_word_connector: ' y ')
  end

  def self.random
    properties = Property.order('RANDOM()').limit(8)
  end

  def self.search(search, page)
    if search
      properties = filter(search.slice(:property_type, :neighborhood)).visible
      properties = properties.for_rent        if search[:transaction_type] == TRANSACTION_TYPES[:rent]
      properties = properties.for_season_rent if search[:transaction_type] == TRANSACTION_TYPES[:season_rent]
      properties = properties.for_sale        if search[:transaction_type] == TRANSACTION_TYPES[:sale]
      properties = Property.filter_by_price(properties, search)

      properties.paginate(page: page)
    else
      visible.paginate(page: page)
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

  def self.filter_by_price(properties, search)
    if search[:transaction_type].present?
      if search[:transaction_type] == TRANSACTION_TYPES[:sale]
        properties = properties.price_lower_or_equal(PRICE_RANGE_SALE[:low_price]) if search[:price] == PRICE_TYPES_SALE[:lower]
        properties = properties.price_lower_or_equal(PRICE_RANGE_SALE[:high_price]).price_greater_or_equal(PRICE_RANGE_SALE[:low_price]) if search[:price] == PRICE_TYPES_SALE[:middle]
        properties = properties.price_greater_or_equal(PRICE_RANGE_SALE[:high_price]) if search[:price] == PRICE_TYPES_SALE[:greater]
      else
        properties = properties.price_lower_or_equal(PRICE_RANGE_RENT[:price]) if search[:price] == PRICE_TYPES_RENT[:lower]
        properties = properties.price_greater_or_equal(PRICE_RANGE_RENT[:price]) if search[:price] == PRICE_TYPES_RENT[:greater]
      end
    end
    properties
  end
  
end
