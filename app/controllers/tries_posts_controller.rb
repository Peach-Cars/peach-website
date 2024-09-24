class TriesPostsController < ApplicationController
    def index
        ghost_client = GhostClientService.new
        @posts = ghost_client.fetch_posts

        if @posts.present?
            render json: @posts.body
        else
            render json: { error: 'No posts found or error occurred' }, status: :unprocessable_entity
        end
    end
    
end
