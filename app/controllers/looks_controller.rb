class LooksController < ApplicationController
  def show
    @look = Look.find(params[:id])
    @pieces = @look.pieces
  end
end
