class AsylumController < ApplicationController
  def index
  	@villains = Villain.all
  end
end
