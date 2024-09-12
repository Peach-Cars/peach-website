# To be used to make various API requests
class BaseApiService
  extend Dry::Initializer

  option :base_url
  option :token, optional: true

  private

  # Lazy connection initialization
  def connection
    @connection ||= Faraday.new(url: base_url) do |faraday|
      faraday.request :url_encoded
      faraday.response :json, content_type: /\bjson$/
      faraday.adapter Faraday.default_adapter
    end
  end

  def get(path)
    response = connection.get(path) do |req|
      headers(req)
    end
    handle_response(response)
  end

  def post(path, payload)
    response = connection.post(path) do |req|
      headers(req)
      req.body = payload.to_json
    end
    handle_response(response)
  end

  def headers(req)
    req.headers["Authorization"] = "Bearer #{token}" if token
    req.headers["Content-Type"] = 'application/json'
  end

  def handle_response(response)
    unless response.success?
      # You can add logging here if needed
      raise ApiError, "Request failed with status #{response.status}: #{response.body}"
    end

    response.body
  end

  class ApiError < StandardError; end
end
