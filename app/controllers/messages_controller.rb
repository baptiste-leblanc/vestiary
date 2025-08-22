class MessagesController < ApplicationController

  def create
  @context = Context.find(params[:context_id])
  @message = Message.new(message_params)
  @message.role = "user"
  @message.context = @context
  objective = @message.context["objective"]
  morphology = @message.context.user["morphology"]
  instructions = "You are a professional personal shopper.
              Your role is to help a client choose looks that best match their needs.
              The client wants a style adapted to its objective (#{objective}) and morphology (#{morphology}).
              3 styles were already suggested but do not fit client expectations.

              Task:
              Generate a new different stylish looks based on the message he will send.

              For each look, provide:
              - a name
              - a short description explaining why it fits perfectly with the client.
              Do not list the individual clothing items.

              Output format:
              Return the result as a JSON with a 'looks' that contains an array of 1 object.
              Each object must have two fields: 'name' and 'description'.
              Do not include extra text before or after the JSON."

    if @message.save
      response = RubyLLM.chat.with_instructions(instructions).ask(@message.content)
      looks_payload = JSON.parse(response.content)["looks"]
      looks_payload = looks_payload[0]
      @look = Look.create!(description: looks_payload["description"], name: looks_payload["name"], context: @context)
      # redirect_to context_path(@context)
      respond_to do |format|
          format.turbo_stream # renders `app/views/messages/create.turbo_stream.erb`
          format.html { redirect_to context_path(@context) }
        end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("new_message", partial: "messages/form", locals: { context: @context, message: @looks }) }
        format.html { render "contexts/show", status: :unprocessable_entity }
      end
    # else
    #   render "chats/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  # def create_looks(array)
  #   array.map do |element|
  #     Look.create!(description: element["description"], name: element["name"], context: @context)
  #   end
  # end

end
