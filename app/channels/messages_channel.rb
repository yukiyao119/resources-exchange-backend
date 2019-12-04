class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "messages"
    stream_for 'exchanges'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    raise NotImplementedError
  end

end
