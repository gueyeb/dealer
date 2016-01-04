timeout = Rails.env.test? ? 60 : 20 # Travis tests need more time to run (they execute slowly)
Rack::Timeout.timeout = timeout # seconds
