class LooksController < ApplicationController

  def index
    @looks = Look.all
  end

  def show
    @look = Look.find(params[:id])
    @pieces = @look.pieces
  end
end
