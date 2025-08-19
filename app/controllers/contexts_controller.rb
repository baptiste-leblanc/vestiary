class ContextsController < ApplicationController
  def new
    @context = Context.new
  end

  def index
    @looks = Look.all
    @contexts = Context.all
  end
end
