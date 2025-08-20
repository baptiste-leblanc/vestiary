class ContextsController < ApplicationController
  def show
    @context = Context.new
    # @context = Context.find(params[:id])
    @looks = Look.all
    @look = Look.new
    # redirect_to context_look_path(@look)
    chat = RubyLLM.chat(model: "gpt-4o").with_params(response_format: { type: 'json_object' })
    system_prompt = "You are a professional personal shopper.
        Your role is to help a client choose look that best match their needs.

        Client profile:
        The look of the client have to be coherent to why he wants to relook, fit the morphology.

        Task:
        Generate up to 3 looks items that form a coherent, stylish look for this client and event.
        For these looks, you have to give a name for this outfit and a short description of the look and why it fits perfectly with the client. Don't give the items of the look.

        Output format:
        Return the result as a JSON object with exactly the fields above. Do not include extra text before or after the JSON."
    response = chat.ask(system_prompt)
    @contexts = JSON.parse(response.content)
  end

  def index
    @context = Context.new
    @contexts = Context.all
    @looks = Look.all
  end

  def create
    @context = Context.new(context_params)
    @context.user = current_user

    if @context.save
      redirect_to context_path(@context)
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def context_params
    params.require(:context).permit(:objective, :budget)
  end
end
