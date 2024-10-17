# Service to fetch posts from ghostcms
class BlogsService < BaseApiService
    include ApiErrorHandler
    option :base_url, default: -> { Rails.application.credentials.dig(:ghost, :base_url) }
    option :token, default: -> { Rails.application.credentials.dig(:ghost, :api_key) }
    option :auth_type, default: -> { 'Token' }

    def fetch_posts
      get("/ghost/api/v3/content/posts/", {key: token})
    end

    # overide get method to allow query params for auth
    def get(path, params = {})
      response = connection.get(path, params)
      handle_response(response)
    end

  end



