class ContextsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    3.times do
      Look.create!(
        context: @context,
        name: "Nouveau look",
        description: "À compléter"
      )
    end

    @looks = @context.looks
  end

  def index
    @user = User.last
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
      redirect_to contexts_path(@user)
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
