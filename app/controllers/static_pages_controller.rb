class StaticPagesController < ApplicationController
  
  before_filter :search_values

  def landing
    @random_properties = Property.random
  end
  
end
