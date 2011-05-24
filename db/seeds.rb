# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#
# Local Cities seed: /Users/fighella/Sites/odation/public/seed/cities.txt
#
require 'open-uri'


Destination.delete_all
open("http://odation.com/seed/cities.txt") do |destinations|
  destinations.read.each_line do |destination|
    cityid, countryid, regionid, city, latitude, longitude, timezone, dmaid, code = destination.chomp.split(",")
      Destination.create!(:cityid => cityid, :countryid => countryid, :regionid => regionid, :title => city, :latitude => latitude, :longitude => longitude, :timezone => timezone, :dmaid => dmaid, :code => code)
  end
end

["Travel", "Deals", "Funny", "Industry", "International", "Australia", "Airlines", "Hotels", "Flights"].each do |tag|  
  Tag.find_or_create_by_name tag  
end

["Admin", "Moderator", "Author"].each do |role|
  Role.find_or_create_by_name role
end