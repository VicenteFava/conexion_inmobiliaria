class StaticPagesController < ApplicationController
  def landing
    @random_properties = Property.random
  end
end
