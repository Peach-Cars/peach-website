# To be used to make various API requests
class BaseApiService
  extend Dry::Initializer

  option :base_url
  option :token, optional: true
  option :auth_type, default: -> { 'Bearer' }

  private

  def connection
    @connection ||= Faraday.new(url: base_url) do |faraday|
      faraday.request :url_encoded
      faraday.response :json, content_type: /\bjson$/
      faraday.adapter Faraday.default_adapter
      faraday.response :logger
    end
  end

  def get(path)
    path = ensure_slash(path)
    response = connection.get(path) do |req|
      headers(req)
    end
    handle_response(response)
  end

  def post(path, payload)
    path = ensure_slash(path)
    response = connection.post(path) do |req|
      headers(req)
      req.body = payload.to_json
    end
    handle_response(response)
  end

  def headers(req)
    req.headers["Authorization"] = "#{auth_type} #{token}" if token
    req.headers["Content-Type"] = 'application/json'
  end

  def handle_response(response)
    if response.success?
      parse_response(response)
    else
      handle_error(response)
    end
  end

  def parse_response(response)
    response
  rescue JSON::ParserError
    Rails.logger.debug("Unable to parse JSON response from URL: #{response.env.url}")
    response.body
  end

  def handle_error(response)
    error_message = "Request failed with status #{response.status}: #{response.body}"
    Rails.logger.error(error_message)
    raise ApiError, error_message
  end

  def ensure_slash(path)
    path.start_with?('/') ? path : "/#{path}"
  end

  class ApiError < StandardError; end
end
