class WelcomeController < ApplicationController
  def index
    @weather = Weather.new
  end
end
