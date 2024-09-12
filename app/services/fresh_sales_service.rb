# Service to push contacts and vehicles to Freshsales
class FreshSalesService < BaseApiService
  option :base_url, default: -> { Rails.application.credentials.dig(:freshsales, :base_url) }
  option :token, default: -> { Rails.application.credentials.dig(:freshsales, :api_key) }
  option :auth_type, default: 'Token'

  def create_contact(data)
    post('/contacts', data)
  rescue ApiError => e
    Rails.logger.error "Failed to create contact in Freshsales: #{e.message}"
    raise
  end

  def create_listing(data)
    post('/cpq/products', data)
  rescue ApiError => e
    Rails.logger.error "Failed to create listing in Freshsales: #{e.message}"
    raise
  end
end
