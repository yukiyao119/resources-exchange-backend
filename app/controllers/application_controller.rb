class ApplicationController < ActionController::API
    # before_action :authorized

    def create_token(payload)
      JWT.encode(payload, signing_secret, 'HS256')
    end

    def auth_header
      request.headers["Authorization"]
    end

    def token 
      if auth_header
        auth_header.split(' ')[1]
      end 
    end
  
    def decoded_token
      # if auth_header
      if token
        # token = auth_header.split(' ')[1]
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
      ENV['JWT_SECRET']
      # Rails.application.credentials.secret_key_base
    end



end
