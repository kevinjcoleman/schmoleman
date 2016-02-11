CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAIEOWO2KLHP6IXB5A',                        # required
    aws_secret_access_key: '+4zjnpDKDaFvaIyhdJC324+BFylu96kU8KURjvmT'                      # required
  }
  config.fog_directory  = 'image-upload-sample'                          # required
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
  config.storage = :fog
end