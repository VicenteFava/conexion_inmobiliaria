class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def search_values
    @property_types = PropertyType.for_select
    @transaction_types = [['Operaciones', [['Alquiler', 1], ['Alquiler temporal', 2], ['Venta', 3]]]]
    @neighborhoods = Neighborhood.for_select
    @prices = []
  end
end
