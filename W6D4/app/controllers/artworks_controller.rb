class ArtworksController < ApplicationController
    def index
        # debugger
       artworks = Artwork.where(artist_id: params[:user_id])
       artworks += Artwork.where(viewer_id: params[:user_id])
       
        #artworks += ArtworkShare.where(user_id: params[:viewer_id])
       render json: artworks
    end
    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save!
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: 422
        end
    end
    def show
        artwork = Artwork.find(params[:id])
        render json: artwork
    end
    def update
        artwork = Artwork.find_by(id: params[:id])
        
        if artwork
            artwork.update(artwork_update_params) 
            redirect_to "/artworks/#{artwork.id}"
        else
            render json: artwork.errors.full_messages, status: 422
        end
    end
    def destroy

        artwork = Artwork.find_by(id: params[:id])

        if artwork
            artwork.destroy
            render json: artwork
        else
            render plain: "User does not exist"
        end
        
        
        

    end

    private
    def artwork_params 
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
    def artwork_update_params
        params.require(:artwork).permit(:title, :image_url)
    end
end
