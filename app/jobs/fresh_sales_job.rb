class FreshSalesJob
  include Sidekiq::Job

  def perform(operation, data)
    freshsales_service = FreshSalesService.new(
      base_url: Rails.application.credentials.dig(:freshsales, :base_url),
      token: Rails.application.credentials.dig(:freshsales, :api_key),
      auth_type: 'Token'
    )

    case operation
    when 'create_contact'
      freshsales_service.create_contact(data)
    when 'create_listing'
      freshsales_service.create_listing(data)
    else
      raise ArgumentError, "Unknown operation: #{operation}"
    end
  end
end
