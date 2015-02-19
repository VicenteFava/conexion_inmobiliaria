class PropertiesController < ApplicationController
  
  before_filter :search_values, only: [:index, :show]

  PRICES_ARRAY = {
    rent_array: [['Precios', [['Menos de US$200.000', 1], ['Entre US$200.000 y US$500.000', 2], ['Más de US$500.000', 3]]]],
    sale_array: [['Precios', [['Menos de $20.000', 1], ['Más de $20.000', 2]]]]
  }

  def index
    @properties = Property.search(search_params, properties_params[:page])
    @search = search_params

    if @search.present? && @search[:transaction_type].present?
      if @search[:transaction_type] == Property::TRANSACTION_TYPES[:sale]
        @prices = PRICES_ARRAY[:sale_array]
      else
        @prices = PRICES_ARRAY[:rent_array]
      end
    end

  end

  def show
    @property = Property.find(properties_params[:id])
  end

  private

  def properties_params
    params.permit(:page, :id)
  end

  def search_params
    params.fetch(:search, {}).permit(:property_type, :transaction_type, :neighborhood, :price)
  end
end
