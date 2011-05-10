# lib/tasks/product_prices.rake
desc "Update Product Details"
task :listing_details => :environment do
  require 'nokogiri'
  require 'open-uri'

  
  Product.find_all_by_category(nil).each do |product|
      url = "http://au.totaltravel.yahoo.com#{product.description}"
      doc = Nokogiri::HTML(open(url))
      category = doc.css("#bread-crumb a").last.text
      product.update_attribute(:category, category)
      address = doc.at_css(".listing-address")
      
      product.update_attribute(:address, address)
    end
      
puts address

end                 
