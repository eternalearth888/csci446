class AsylumController < ApplicationController
  def index
  	@villains = Villain.all
	@cart = current_cart
  end
end
