class PropertiesController < ApplicationController
  
  def index
    puts '/' * 100
    puts params
    puts params[:search]
    puts '/' * 100

    @properties = Property.search(params[:search], params[:page])
    @search = params[:search]

    @property_types = PropertyType.for_select
    @transaction_types = [['Operaciones', [['Alquiler', 1], ['Alquiler temporal', 2], ['Venta', 3]]]]
    @neighborhood = Neighborhood.for_select
  end

  def show
    @property = Property.find(params[:id])
  end

  private

  def search_params
    params.permit(:search, :page)
  end
end
