class LooksController < ApplicationController

  require 'ruby_llm/schema'
  require 'json'

  def show
    @look = Look.find(params[:id])
    chat = RubyLLM.chat(model: "gpt-4o").with_params(response_format: {type: 'json_object'})
    system_prompt = "You are a professional personal shopper.
      Your role is to help a client choose clothing pieces that best match their needs.

      Client profile:
      - Objective: wedding with #{@look.name}
      - Morphology: large build
      - Budget: medium

      Task:
      Generate up to 5 clothing items that form a coherent, stylish outfit for this client and event. Each item should include realistic values for:
      clothing_category, name, description, price, brand, shop_url.

      Constraints:
      - Fit the wedding context (formal, elegant)
      - Adapted to large morphology (comfortable, flattering cuts)
      - Stay within medium budget

      Output format:
      Return the result as a JSON object with exactly the fields above. Do not include extra text before or after the JSON."
      response = chat.ask(system_prompt)
      @pieces = JSON.parse(response.content)
    end
# @pieces = @look.pieces
# chat.with_instructions(system_prompt)
# prompt = "Here is the Json with the list of clothing pieces you can use:"
# response = chat.ask(prompt, with: {json: "db/pieces_500_real.json"})
end
