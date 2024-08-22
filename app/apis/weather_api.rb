require 'uri'
require 'net/http'

class WeatherApi
  def self.get_weather(street_address)

    if Rails.cache.read(street_address)
      return WeatherResult.new(Rails.cache.read(street_address), { cached: true })
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
    Rails.cache.write(street_address, body, expires_in: 30.minutes)
    return WeatherResult.new(body)
  end
end