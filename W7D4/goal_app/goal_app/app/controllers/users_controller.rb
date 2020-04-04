class UsersController < ApplicationController
    def new
        # this is a get for the form sign-up
        # @user = User.new
        render :new
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def create
        # Post from the form on :new, to save info to db
        @user = User.new(user_params)
        if @user.save!
            login!(@user)
            flash[:notice] = ['Congrats, you are now signed in!']
            redirect_to user_url(@user)
        else
           flash.now[:errors] = @users.errors.full_messages
           render :new
        end
    end

    def destroy
        @user = User.find_by(id: params[:id])
        @user.destroy
        redirect_to users_url
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)  #do we need session_token here?
    end
end
