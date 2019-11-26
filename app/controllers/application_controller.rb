class ApplicationController < ActionController::API
    # before_action :authorized

    def create_token(payload)
      JWT.encode(payload, signing_secret, 'HS256')
    end


    def auth_header
      request.headers["Authorization"]
    end
  
    def decoded_token
      if auth_header
        token = auth_header.split(' ')[1]
        # header: { 'Authorization': 'Bearer <token>' }
        begin
          JWT.decode(token, signing_secret, true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
      end
    end

    def current_user
      if decoded_token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
      end
    end
   
    # def logged_in?
    #   !!current_user
    # end
   
    # def authorized
    #   render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    # end

    def signing_secret
      # ENV['jwt_secret']
      Rails.application.credentials.jwt_my_secret
    end


    # private

    # def create_token(user_id)
    #   JWT.encode({ user_id: user_id }, signing_secret, 'HS256')
    # end

    # def user_id_from_token
    #   begin
    #     token = request.headers["Authorization"]
    #     decoded_token = JWT.decode(token, signing_secret, true, { algorithm: 'HS256' })
    #     return decoded_token.first["user_id"] 
    #   rescue 
    #     return nil
    #   end
    # end
  
    # def token_is_valid
    #   user_id_from_token != nil
    # end

    # def current_user
    #     User.find(user_id_from_token)
    # end
  
    # def signing_secret
    #   ENV["YUKI_JWT_SECRET_KEY"]
    # end


end
