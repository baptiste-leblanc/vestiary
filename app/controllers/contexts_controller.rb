class ContextsController < ApplicationController
  def index
    @context = Context.new
    @contexts = Context.all
  end
  def create
    @context = Context.new(context_params)
    @context.user = current_user
    if @context.save
      generate_looks
      redirect_to context_path(@context)
    else
      render :index, status: :unprocessable_entity
    end
  end
  def show
    @context = Context.find(params[:id])
    @looks = @context.looks
  end
  
  private

  def context_params
    params.require(:context).permit(:objective, :budget)
  end


  def create_looks(array)
    @looks = array.map do |element|
      Look.create!(description: element["description"], name: element["name"], context: @context)
    end
  end

  def generate_looks
    chat = RubyLLM.chat(model: "gpt-4o").with_params(response_format: { type: 'json_object' })
    system_prompt = 'You are a professional personal shopper.
              Your role is to help a client choose looks that best match their needs.
              Client profile:
              The looks must be coherent with the input fields: objective and morphology.
              Task:
              Generate exactly 3 different stylish looks for this client and event.
              For each look, provide:
              - a name
              - a short description explaining why it fits perfectly with the client.
              Do not list the individual clothing items.
              Output format:
              Return the result as a JSON with a "looks" that contains an array of 3 objects.
              Each object must have two fields: "name" and "description".
              Do not include extra text before or after the JSON.'
    # prompt = "Objective:" @context.objective &"/n"&"Morphology: Fat"
    response = chat.with_instructions(system_prompt).ask(@context.objective)
    looks_payload = JSON.parse(response.content)["looks"]
    create_looks(looks_payload)
  end
end
