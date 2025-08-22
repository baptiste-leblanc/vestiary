class LooksController < ApplicationController
  require 'ruby_llm/schema'
  require 'json'
  require "open-uri"

  def show
    @look = Look.find(params[:id])
    morphology = "large build"
    chat = RubyLLM.chat(model: "gpt-4o").with_params(response_format: {type: 'json_object'})
    system_prompt = "You are a professional personal shopper.
    Your role is to help a client choose clothing pieces that best match their needs with a dynamic and concise tone.

    Client profile:
    - Objective: wants pieces for this style: #{@look.name}
    - Morphology: #{morphology}
    - Budget: #{@look.context['budget']}

    Task:
    Generate up to 5 clothing items that form a coherent, stylish outfit for this client and objects. All the results will be saved into an array called 'clothing_items' of items hashes. Each item should include realistic values for:
    clothing_category, name, description, price (without currency sign), brand, shop_url, unsplash_query.

    Constraints:
    - Fit the style objective
    - Adapted to morphology
    - Stay within budget
    - Description should be displayed as only one catchy sentence, as simple and effective as possible. This sentence should contain up to 12 words and shouldn't be displayed the name of the look.
    - Have the relevant keywords for an image query in unsplash (with words separated by _)


    Output format:
    Return the result as a JSON object with exactly the fields above. Do not include extra text before or after the JSON."
    response = chat.ask(system_prompt)
    @pieces = JSON.parse(response.content)
  end

  def create
    @context = Context.find(params[:context_id])
    raise
    @look = @context.looks.build(look_params)

    if @look.save
      redirect_to context_path(@context), notice: "Look created!"
    else
      render "contexts/show", status: :unprocessable_entity
    end
  end
end
