class FreshSalesJob
  include Sidekiq::Job

  def perform(operation, data, lead_id)
    freshsales_service = FreshSalesService.new(
      base_url: Rails.application.credentials.dig(:freshsales, :base_url),
      token: Rails.application.credentials.dig(:freshsales, :api_key),
      auth_type: 'Token'
    )

    success = false

    case operation
    when 'create_contact'
      success = freshsales_service.create_contact(data)
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
