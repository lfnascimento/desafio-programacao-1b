I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}')]

I18n.default_locale = :'pt-BR'
I18n.locale = :'pt-BR'
