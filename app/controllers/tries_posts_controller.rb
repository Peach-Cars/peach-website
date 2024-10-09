class TriesPostsController < ApplicationController
    def index
      ghost_client = GhostClientService.new
      response = ghost_client.fetch_posts
  
      if response.present?
        @posts_data = response.body

    else
        @posts_data = []
      end
    end

  end
  
  
  