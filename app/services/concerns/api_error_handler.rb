# handle api errors
module ApiErrorHandler
  extend ActiveSupport::Concern

  included do
    def handle_api_errors
      yield
    rescue ApiError => e
      log_api_error(e)
      false
    end
  end

  private

  def log_api_error(error)
    Rails.logger.error "API Error: #{error.message}"
  end
end
