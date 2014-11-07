class StaticPagesController < ApplicationController
  
  def landing
    @random_properties = Property.random

    
    @property_types = PropertyType.for_select
    @transaction_types = [['Operaciones', [['Alquiler', 1], ['Alquiler temporal', 2], ['Venta', 3]]]]
    @neighborhood = Neighborhood.for_select
  end

  def contact

  end

  def email
  	puts '*' * 300
  	puts params

  	redirect_to root_path
  end
  
end
