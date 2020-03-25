class ApplicationController < ActionController::Base
    helper_method :current_user, :login_user!

    def login_user!(user)
        @current_user = user
        session[:session_token] = user.reset_session_token!
    end

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logout
        if logged_in?
            @current_user.reset_session_token!
            session[:session_token] = nil
            @current_user = nil
        end
    end

    def logged_in?
        !!current_user
    end

    def require_logged_in
        redirect_to new_session_url unless logged_in?
    end

    def require_log_out
        redirect_to users_url if logged_in?
    end 

    def cats_owner 
        
    end
end

