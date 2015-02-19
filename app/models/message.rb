class Message
  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :email, :subject, :phone, :content

  validates :name, :email, :subject, :content, presence: true
end
