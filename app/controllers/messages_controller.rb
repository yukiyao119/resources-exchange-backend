class MessagesController < ApplicationController

    def index
        messages = Message.all
        render json: messages, include: "**", status: 200
    end

    def show 
        message = Message.find(params[:id])
        render json: message, include: "**", status: 200
    end

    def create
        exchange = Exchange.find(params[:exchange_id])
        message = Message.create(message_params)
        # message.user = current_user
        if message.valid?
        #   ActionCable.server.broadcast 'messages',
        #     message: message.content,
        #     user: message.user.username
        #   head :ok
            MessagesChannel.broadcast_to(exchange, ExchangeSerializer.new(exchange))
        else
            render json: { errors: message.errors.full_messages } , status: :unprocessable_entity
        end
        
      end


    private

    def message_params
        params.permit(:user_id, :exchange_id, :content)
    end

end
