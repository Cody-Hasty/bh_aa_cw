class GoalsController < ApplicationController
    # before_action # must be logged in

    def index

    end

    def show

    end

    def new

    end

    def create

    end 


    private

    def user_params
        params.require(:goal).permit(:title, :body, :author_id, :completed)
    end
end
