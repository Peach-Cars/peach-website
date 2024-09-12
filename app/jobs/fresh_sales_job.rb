class FreshSalesJob
  include Sidekiq::Job

  def perform(operation, data)
    freshsales_service = FreshSalesService.new

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
