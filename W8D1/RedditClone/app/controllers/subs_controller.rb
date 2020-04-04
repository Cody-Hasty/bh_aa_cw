class SubsController < ApplicationController
    before_action :require_signed_in!, only: [:new, :create, :edit, :update]

    def index
        @subs = Sub.all
        render :index
    end
    
    def show
        @sub = Sub.find(params[:id])
    end
    
    def new
        @sub = Sub.new
    end

    def create
        @sub = current_user.subs.new(sub_params)
        @sub.mod_id = current_user.id

        if @sub.save
            # redirect to the new sub or to a list of all the user's subs?
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def edit
        @sub = Sub.find(params[:id])
    end

    def update
        @sub = Sub.find(params[:id])

        if @sub.update_attributes(sub_params)
            flash[:notices] = ['Sub updated']
            redirect_to @sub
        else
            flash[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    private
    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end
