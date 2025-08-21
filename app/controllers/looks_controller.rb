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
      clothing_category, name, description, price (without currency sign), brand, shop_url.

      Constraints:
      - Fit the wedding context (formal, elegant)
      - Adapted to large morphology (comfortable, flattering cuts)
      - Stay within medium budget

      Output format:
      Return the result as a JSON object with exactly the fields above. Do not include extra text before or after the JSON."
      response = chat.ask(system_prompt)
      @pieces = JSON.parse(response.content)

      api_key = ENV["UNSPLASH_API_KEY"]

      url = "https://api.unsplash.com/search/photos?client_id=#{api_key}&page=1&query=office"
      image_serialized = URI.parse(url).read
      image = JSON.parse(image_serialized)
      raise
    end
# @pieces = @look.pieces
# chat.with_instructions(system_prompt)
# prompt = "Here is the Json with the list of clothing pieces you can use:"
# response = chat.ask(prompt, with: {json: "db/pieces_500_real.json"})
end
