class AsylumController < ApplicationController
  def index
  	@cart = current_cart
  	@villains = Villain.all
  end
end
