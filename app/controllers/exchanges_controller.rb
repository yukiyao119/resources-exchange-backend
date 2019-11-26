class ExchangesController < ApplicationController

    def index
        exchanges = Exchange.all
        render json: exchanges, include: "**", status: 200
    end

    def show 
        exchange = Exchange.find(params[:id])
        # if user_id_from_token == user_id.to_i
        #     user = User.find(user_id) 
        #     render json: user
        # else 
        #     render json: { wrong_token: true}, status: :unauthorized
        # end
        render json: exchange, include: "**", status: 200
    end

    def create
        exchange = Exchange.create(exchange_params)
        # if user.valid?
        #     render json: {ok: true}
        # else
        #     render json: { errors: user.errors.full_messages } , status: :unprocessable_entity
        # end 
        render json: exchange, include: "**", status: 200
    end

    # def login
    #     user = User.find_by("lower(username) = ?", params[:username].downcase)
    #     render json: @user, include: "**", status: 200
    # end


    private

    def exchange_params
        params.permit(:exchanger_id, :exchangee_id, :time, :location)
    end


end
