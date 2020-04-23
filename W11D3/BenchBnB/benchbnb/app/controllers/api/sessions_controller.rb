class Api::SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    before_action :require_logged_in, only: [:destroy]

    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )

        if @user.nil?
            render json: {errors: 'invalid username or password'}, status: 401 
        else
            login!(@user)
            render json: ['success']
        end
    end


    def destroy 
        # render json: status: 404 if !current_user
        logout!
        render json: {}
    end

end