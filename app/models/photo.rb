class Photo < ActiveRecord::Base
  belongs_to :property

  has_attached_file :photo, :styles => { :medium => "800x" },
                    #:convert_options => { :thumb => "-quality 92" }, 
                    #PROBAR DEPSUES CON FOTOS GRANDES
                    :url => "/assets/images/:property_id/:basename.:extension",  
                    :path => ":rails_root/public/assets/images/:property_id/:basename.:extension"  

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => [ "image/jpg",
                                                               "image/jpeg",
                                                               "image/png",
                                                               "image/gif" ]

  def url
     photo.url(:medium)
  end

  def path
     photo.url(:medium)
  end
end
