class Neighborhood < ActiveRecord::Base
  
  has_many :properties

  def self.for_select
    neighborhoods = Neighborhood.select("id, name").all.order("name").map{ |v| [v.name, v.id] }
    for_select = [['Barrios', neighborhoods]]
  end
end
