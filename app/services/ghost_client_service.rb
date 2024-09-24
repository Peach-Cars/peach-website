# Service to push contacts and vehicles to Freshsales
class GhostClientService < BaseApiService
    include ApiErrorHandler
    option :base_url, default: -> { Rails.application.credentials.dig(:ghost, :base_url) }
    option :token, default: -> { Rails.application.credentials.dig(:ghost, :api_key) }
    option :auth_type, default: -> { 'Token' }
  
  end
  