class Property < ActiveRecord::Base

  belongs_to :client
  belongs_to :property_type
  belongs_to :neighborhood
  
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos

  has_many :done_transactions, dependent: :destroy
  accepts_nested_attributes_for :done_transactions

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
