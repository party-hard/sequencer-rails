Rails.application.configure do
  # Session store
  #config.session_store :cookie_store, key: '_sq_session', domain: '.sequencer.pro'

  # Code is not reloaded between requests
  config.cache_classes = true
  config.eager_load = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.action_controller.action_on_unpermitted_parameters = :log

  config.active_record.raise_in_transactional_callbacks = true
end
