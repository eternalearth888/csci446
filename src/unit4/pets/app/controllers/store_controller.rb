class StoreController < ApplicationController
  def index
  	@pets = Pet.all
  end
end
