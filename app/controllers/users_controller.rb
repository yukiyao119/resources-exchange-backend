class UsersController < ApplicationController
    # skip_before_action :authorized, only: [:create, :index]
    
    def index
        users = User.all
        render json: users, include: "**", status: 200
    end

    def profile
        render json: {token: token, user: UserSerializer.new(current_user) } , status: :accepted
    end

    def create
        # debugger
        user = User.create(user_params)
        # user_id = user.id
        if user.valid?
            token = create_token({user_id: user.id})
            render json: { token: token, user: user, include: "**" }, status: :created
        else
            render json: { errors: user.errors.full_messages } , status: :unprocessable_entity
        end 
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user, include: "**", status: 200
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: user
    end 



    private

    def user_params
        params.permit(:username, :password, :displayname, :donated_hour, :time_slot, :location, :img, :bio)
    end
    
end

