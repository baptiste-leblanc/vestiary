class LooksController < ApplicationController

  def index
    @looks = Look.all
  end
end
