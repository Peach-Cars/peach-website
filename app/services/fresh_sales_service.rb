# Service to push contacts and vehicles to Freshsales
class FreshSalesService < BaseApiService
  option :base_url, default: -> { Rails.application.credentials.dig(:freshsales, :base_url) }
  option :token, default: -> { Rails.application.credentials.dig(:freshsales, :api_key) }
  option :auth_type, default: -> { 'Token' }

  def create_contact(data)
    response = post('/contacts', data)
    response.success?
  rescue ApiError => e
    Rails.logger.error "Failed to create contact in Freshsales: #{e.message}"
    false
  end

  def create_listing(data)
    response = post('/cpq/products', data)
    response.success?
  rescue ApiError => e
    Rails.logger.error "Failed to create listing in Freshsales: #{e.message}"
    false
  end
end
