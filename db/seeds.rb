# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first) 


Destination.delete_all
open("/public/seed/cities.txt") do |destinations|
  destinations.read.each_line do |destination|
    cityid, countryid, regionid, city, latitude, longitude, timezone, dmaid, code = destination.chomp.split(",")
      Destination.create!(:cityid => cityid, :countryid => countryid, :regionid => regionid, :city => title, :latitude => latitude, :longitude => longitude, :timezone => timezone, :dmaid => dmaid, :code => code)
  end
end