# Service to push contacts and vehicles to Freshsales
class FreshSalesService < BaseApiService
  include ApiErrorHandler
  option :base_url, default: -> { Rails.application.credentials.dig(:freshsales, :base_url) }
  option :token, default: -> { Rails.application.credentials.dig(:freshsales, :api_key) }
  option :auth_type, default: -> { 'Token' }

  def create_contact(data)
    handle_api_errors do
      response = post('/crm/sales/api/contacts', data)
      response.success?
    end
  end

  def create_listing(data)
    handle_api_errors do
      response = post('/crm/sales/api/cpq/products', data)
      response.success?
    end
  end
end
