class FreshSalesJob < ApplicationJob
  queue_as :default

  def perform(operation, data, lead_id)
    freshsales_service = FreshSalesService.new(
      base_url: ENV.fetch("FRESH_SALES_URL"),
      token: ENV.fetch("FRESH_SALES_KEY"),
      auth_type: 'Token'
    )

    success = false

    case operation
    when 'create_contact'
      success = freshsales_service.create_contact(data)
      Rails.logger.debug "Success value: #{success}"
    when 'create_listing'
      success = freshsales_service.create_listing(data)
    else
      raise ArgumentError, "Unknown operation: #{operation}"
    end

    update_lead_status(lead_id, success)
  end

  private

  def update_lead_status(lead_id, success)
    lead = Lead.find_by(id: lead_id)
    return unless lead

    if success
      lead.update(sent_to_freshsales: true)
    else
      Rails.logger.error("Failed to update lead #{lead_id} status")
    end
  end
end
