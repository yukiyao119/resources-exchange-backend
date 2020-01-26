class AuthController < ApplicationController
    # skip_before_action :authorized, only: [:login]

    def login
        # byebug
        user = User.find_by(username: user_login_params[:username])
        
        if user && user.authenticate(user_login_params[:password])
            token = create_token(user_id: user.id)
            render json: { token: token, user: UserSerializer.new(user) }, status: :accepted
            # render :json => {
            #     :token => token, 
            #     :user => UserSerializer.new(user)
            # }, status: :accepted
            # json: @customers, :include => [:address, :subscription]
        else
            render json: { errors: [ "That didn't match any users WE know about 💁, Please try again" ] }, status: :unprocessable_entity
        end

    end 

    # def persist
    #     if auth_header
    #         encoded_token = request.headers['Authorization'].split(' ')[1]
    #         token = JWT.decode(encoded_token, secret)
    #         user_id = token[0]['user_id']
    #         user = User.find(user_id)
    #         render json: user
    #     end
    # end

    
    private

    def user_login_params
        params.permit(:username, :password)
    end

end
