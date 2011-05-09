# lib/tasks/product_prices.rake
desc "Fetch product prices"
task :fetch_prices => :environment do
  require 'nokogiri'
  require 'open-uri'
  
Product.find_all_by_long(nil).each do |product|
    url = "http://maps.googleapis.com/maps/api/geocode/xml?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&sensor=true_or_false"
    doc = Nokogiri::HTML(open(url))
    price = doc.at_css(".camelPrice").text[/[0-9\.]+/]
    product.update_attribute(:price, price)
  end
end         

# lib/tasks/product_prices.rake
desc "Update Product Details"
task :listing_details => :environment do
  require 'nokogiri'
  require 'open-uri'

  
  Product.find_all_by_category(nil).each do |product|
      url = "http://www.walmart.com/search/search-ng.do?search_constraint=0&ic=48_0&search_query=robin&Find.x=0&Find.y=0&Find=Find"
      doc = Nokogiri::HTML(open(url))
      category = doc.css("#bread-crumb").text
      product.update_attribute(:category, category)
    end
  

end