class LooksController < ApplicationController
  require 'ruby_llm/schema'
  require 'json'
  require "open-uri"

  def show
    @look = Look.find(params[:id])
    morphology = "large build"
    chat = RubyLLM.chat(model: "gpt-4o").with_params(response_format: {type: 'json_object'})
    system_prompt = "You are a professional personal shopper.
    Your role is to help a client choose clothing pieces that best match their needs.

    Client profile:
    - Objective: wants pieces for this style: #{@look.name}
    - Morphology: #{morphology}
    - Budget: #{@look.context['budget']}

    Task:
    Generate up to 5 clothing items that form a coherent, stylish outfit for this client and event. Each item should include realistic values for:
    clothing_category, name, description, price (without currency sign), brand, shop_url, unsplash_query.

    Constraints:
    - Fit the style objective
    - Adapted to large morphology (comfortable, flattering cuts)
    - Stay within medium budget
    - Have the relevant keywords for an image query in unsplash (with words separated by _)


    Output format:
    Return the result as a JSON object with exactly the fields above. Do not include extra text before or after the JSON."
    response = chat.ask(system_prompt)
    @pieces = JSON.parse(response.content)
  end
end
