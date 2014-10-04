class PropertiesController < ApplicationController
  def index
  	puts '/' * 100
  	puts params
  	puts '/' * 100

  	if params.has_key?(:property_type_id) 
  		@properties = Property.where(visible: false).paginate(:page => params[:page])
  	else
  		@properties = Property.where(visible: true).paginate(:page => params[:page])
  	end

    @property_types = PropertyType.for_select
    @transaction_types = [['Operaciones', [['Alquiler', 1], ['Alquiler temporal', 2], ['Venta', 3]]]]
    @neighborhood = Neighborhood.for_select
    @prices = [['Alquileres', [['Menos de $10000', 1], ['Entre de $10000 y $20000', 2], ['Mas de $20000', 3]]], ['Ventas', [['Menos de US$100000', 4], ['Entre US$100000 y US$300000', 5], ['Mas de US$300000', 6]]]]
  end

  def show
  end
end
