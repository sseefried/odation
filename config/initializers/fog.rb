CarrierWave.configure do |config|
      config.fog_credentials = {
        :provider               => 'AWS',       # required
        :aws_access_key_id      => 'AKIAJV4L35PHYMY53TPA',       # required
        :aws_secret_access_key  => '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',       # required
        :region                 => 'us-east-1'  # optional, defaults to 'us-east-1'
      }
      
      
      config.fog_directory  = 'odationimg'                     # required
      
      
     config.fog_host       = 'https://s3.amazonaws.com/'            # optional, defaults to nil
      config.fog_public     = false                                   # optional, defaults to true
      config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
    end