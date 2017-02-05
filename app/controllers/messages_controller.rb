class MessagesController < ApplicationController

  def index
    @messages =  Message.all
  end


  def create
    @message = Message.create(message_params)
    MessageSendJob.perform_async(@message.id)
    render 'message'
  rescue => e
    render json: { error: e.message}
  end

private

  def message_params
    mp = params.require(:message).permit(:subject, :body, :recipients)
    mp[:recipients] = mp[:recipients].split(',')
    mp
  end

end
