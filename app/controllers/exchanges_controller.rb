class ExchangesController < ApplicationController

    def index
        exchanges = Exchange.all
        render json: exchanges, include: "**", status: 200
    end

    def show 
        exchange = Exchange.find(params[:id])
        render json: exchange, include: "**", status: 200
    end

    def create
        exchange = Exchange.create(exchange_params)
        render json: exchange, include: "**", status: 200
    end

    def destroy 
        exchange = Exchange.find(params[:id])
        exchange.destroy
        render json: exchange
    end


    private

    def exchange_params
        params.permit(:exchanger_id, :exchangee_id, :time, :location)
    end


end
