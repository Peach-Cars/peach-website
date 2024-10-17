class BlogsController < ApplicationController
    def index
      ghost_client = GhostClientService.new
      response = ghost_client.fetch_posts

      if response.present?
          @posts_data = response.body

      else
          @posts_data = []
          @pagination = {}

        end

  end
end
