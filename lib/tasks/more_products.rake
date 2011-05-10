# lib/tasks/more_products.rake
desc "Fetch more products"
task :more_products => :environment do
  require 'nokogiri'
  require 'open-uri'

  base_url = "http://au.totaltravel.yahoo.com/directory/accommodation/australia/nsw/northernrivers/"
  doc = Nokogiri::HTML(open(base_url))
  number_of_pages = doc.at_css(".result-num em").text[/[0-9]+/].to_i/19
  
  i = 1

  while number_of_pages > i do  
    paginated_url = "http://au.totaltravel.yahoo.com/directory/accommodation/australia/nsw/northernrivers/#{i}/"
    doc = Nokogiri::HTML(open(paginated_url))
    results = doc.css(".resultitem")

    results.each do |t|
      title = t.at_css("h3").text
      scrapedurl = t.at_css("a")[:href]
      product = Product.new(:title => title, :description => scrapedurl)
      product.save
    end
    i = i + 1

  end

  puts number_of_pages   

end                 

  