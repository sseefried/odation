Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'ksgxAgyV29LaiVW7pVWQ', 'wiQiNSU9rrtVjIfuU1u4fUSQanVMjavMCbD3slQA9E'
  provider :facebook, '109302305823116', '6f47102b5953e0c2b36f2a2f756f29ef'
end    
