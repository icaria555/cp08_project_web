
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "7JE8AI6WUOF3czii9CvKTmbg6", "q5WDvWgAcIrxz11NjfXXhRZtOlngnlMJJ120Y5Yc9VFimeUh56"
                     #apikey                      apisecret
end

# Added to config/initializers/omniauth.rb
OmniAuth.config.on_failure = Proc.new do |env|
  message_key = env['omniauth.error.type']
  new_path = "#{env['SCRIPT_NAME']}#{OmniAuth.config.path_prefix}/failure?message=#{message_key}"
  Rack::Response.new(["302 Moved"], 302, 'Location' => new_path).finish
end


