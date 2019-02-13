Mailjet.configure do |config|
  config.api_key = Rails.application.credentials.dig(:MAILJET_SMTP_KEY)
  config.secret_key = Rails.application.credentials.dig(:MAILJET_SMTP_SECRET_KEY)
  config.default_from = 'colin.lecordier@email.fr'
end
