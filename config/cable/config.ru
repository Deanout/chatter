require_relative '../environment'
Rails.application.eager_load!
ActionCable.server.config.disable_request_forgery_protection = true

run ActionCable.server
