require 'uri'
require 'net/http'

class WeatherApi
  def self.get_weather(street_address)
    cache_key = cache_key(street_address)
    if Rails.cache.read(cache_key)
      return WeatherResult.new(Rails.cache.read(cache_key), { cached: true })
    end

    url = URI("https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/" +
                ERB::Util.url_encode(street_address) + "?unitGroup=us&" +
                "key=" + ENV['VISUAL_CROSSING_API_KEY'] +
                "&contentType=json")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["cache-control"] = 'no-cache'

    response = http.request(request)

    if (response.code != "200")
      return WeatherResult.new("{}",  error: true )
    end

    body = response.read_body
    Rails.cache.write(cache_key, body, expires_in: 30.minutes)
    return WeatherResult.new(body)
  end


  # Placeholder for a more sophisticated cache key based on the domain logic.
  # Perhaps removing stop words and and more punctuation.
  def self.cache_key(s)
    return 'no-address' if s.blank?
    s.gsub(/[\s,\.]+/, "").downcase
  end
end