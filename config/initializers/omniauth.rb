Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '179805532042172', '65f63efbc95e56ed9801df02e892b135'
end