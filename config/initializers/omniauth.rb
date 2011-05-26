

Rails.application.config.middleware.use OmniAuth::Builder do
  
  provider :twitter, 'ksgxAgyV29LaiVW7pVWQ', 'wiQiNSU9rrtVjIfuU1u4fUSQanVMjavMCbD3slQA9E',{:client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}}
  
  
  provider :facebook,Facebook::APP_ID, Facebook::SECRET,{:client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}}
  
  
  
end    

