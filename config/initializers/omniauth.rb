Rails.application.config.middleware.use OmniAuth::Builder do
 provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
	scope: 'email, public_profile', info_fields: 'name, email, first_name, last_name', display: 'popup', client_options: { ssl: { ca_file: '/usr/lib/ssl/certs/ca-certificates.crt' }}
end 