class ContextsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @looks = Look.all
    @contexts = Context.all
    @context = Context.new
  end

  def new
    @context = Context.new
  end

  def create
    @context = Context.new(context_params)
    @context.user = @user

    if @context.save
      redirect_to user_contexts_path(@user)
    else
      @contexts = @user.contexts
      render :index, status: :unprocessable_entity
    end
  end

  # private

  # def context_params
  #   params.require(:context).permit(:objective, :budget)
  # end
end
