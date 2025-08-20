class ContextsController < ApplicationController
  def show
    @context = Context.new
    # @context = Context.find(params[:id])
    @looks = Look.all
    @look = Look.new
    # redirect_to context_look_path(@look)
    # /contexts/:context_id/looks/:id(.:format)
  end

  def index
    @contexts = Context.all
    @context = Context.new
    @looks = Look.all
  end

  def create
    @context = Context.new(context_params)
    @context.user = current_user

    if @context.save
      redirect_to context_path(@context)
    else
      @looks = Look.all
      render :index, status: :unprocessable_entity
    end
  end

  private

  def context_params
    params.require(:context).permit(:objective, :budget)
  end
end
