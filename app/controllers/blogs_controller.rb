class BlogsController < ApplicationController
    def index
      ghost_client = GhostClientService.new
      response = ghost_client.fetch_posts

      if response.present?
          @posts_data = response.body
          @pagination = @posts_data['meta']['pagination']
          Rails.logger.info("Pagination Data: #{@pagination}")

      else
          @posts_data = []
          @pagination = {}

        end

  end
end
