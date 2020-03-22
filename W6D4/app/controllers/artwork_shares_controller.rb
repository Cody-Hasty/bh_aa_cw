class ArtworkSharesController < ApplicationController
    def create
        share = ArtworkShare.new(share_params)
        if share.save!
            render json: share
        else
            render json: share.errors.full_messages, status: 422
        end
    end
    def destroy
        share = ArtworkShare.find_by(id: params[:id])
        if share
            share.destroy
            render json: share
        else
            render plain: "User does not exist"
        end
    end
    private
    def share_params
        params.require(:share).permit(:viewer_id, :artwork_id)
    end
end