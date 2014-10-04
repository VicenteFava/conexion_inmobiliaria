class PropertyType < ActiveRecord::Base

  has_many :properties

  validates :name, presence: true
  validates :category, presence: true

  def self.for_select
    personal = PropertyType.select("id, name").where("category = 'Personal'").order("name").map{ |v| [v.name, v.id] }
    business = PropertyType.select("id, name").where("category = 'Negocio'").order("name").map{ |v| [v.name, v.id] }
    for_select = [['Personal', personal], ['Negocio', business]]
  end
end
