class StaticPagesController < ApplicationController
  def landing
    @random_properties = Property.random

    
    @property_types = PropertyType.for_select
    @transaction_types = [['Operaciones', [['Alquiler', 1], ['Alquiler temporal', 2], ['Venta', 3]]]]
    @neighborhood = Neighborhood.for_select
    @prices = [['Alquileres', [['Menos de $10000', 1], ['Entre de $10000 y $20000', 2], ['Mas de $20000', 3]]], ['Ventas', [['Menos de US$100000', 4], ['Entre US$100000 y US$300000', 5], ['Mas de US$300000', 6]]]]
  end
end
