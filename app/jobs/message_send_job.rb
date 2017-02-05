class MessageSendJob
  include Sidekiq::Worker
  sidekiq_options queue: :message_send, retry: false, backtrace: true

  def perform(id)
    message = Message.find(id)
    message.update_attribute(is_sent, ExternalService.send(message))
  end
end
