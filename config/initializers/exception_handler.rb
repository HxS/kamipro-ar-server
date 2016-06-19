Rails.application.config.middleware.insert_before Rack::Cors, Kamiproar::ExceptionHandler
