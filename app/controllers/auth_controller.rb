class AuthController < ApplicationController
    # skip_before_action :authorized, only: [:login]

    def login
        # byebug
        user = User.find_by(username: user_login_params[:username])
        
        if user && user.authenticate(user_login_params[:password])
            token = create_token(user_id: user.id)
            render json: { token: token, user_id: user.id }, status: :accepted
        else
            render json: { errors: [ "That didn't match any users WE know about 💁" ] }, status: :unprocessable_entity
        end

    end 

    private

    def user_login_params
        params.permit(:username, :password)
    end

end
