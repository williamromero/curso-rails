I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]
I18n.available_locales = [:en, :es] # Permitted locales available for the application
I18n.default_locale = :en # Set default locale to something other than :en
