Faraday.default_adapter = :net_http  # You can use other adapters like :typhoeus or :excon

# Optional: Configure Faraday connection with default settings
Faraday.default_connection = Faraday.new do |conn|
  conn.adapter Faraday.default_adapter
  conn.response :logger  # Log requests and responses for debugging (optional)
  conn.headers['Content-Type'] = 'application/json'
  # You can add additional middleware or settings here if needed
end