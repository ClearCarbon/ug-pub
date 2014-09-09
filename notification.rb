require 'geocoder'
require 'uri'
require './publisher'

class Notification
  def receive(update)
    puts update
    if update.include? '#TestUgPubAnnounce'
      matches = update.match(/.?"(.+)".?/)
      unless matches.nil?
        venue = {}
        venue['name'] = matches[0].gsub('"', '').strip
        venue['address'] = "#{venue['name']}, Sheffield, UK"
        venue['url'] = venue_url(venue['address'])
        pub = Publisher.new
        pub.publish(venue)
      end
    end
  end

  def venue_url(address)
    encoded_address = URI::escape(address)
    "https://www.google.co.uk/maps/search/#{encoded_address}"
  end
end
