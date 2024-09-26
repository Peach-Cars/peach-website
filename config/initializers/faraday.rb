Faraday.default_adapter = :net_http

Faraday.default_connection = Faraday.new do |conn|
  conn.adapter Faraday.default_adapter
  conn.response :logger  
  conn.headers['Content-Type'] = 'application/json'
end