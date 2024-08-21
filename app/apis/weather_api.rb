require 'uri'
require 'net/http'

class WeatherApi
  def self.get_weather(address)
    # example:
    url = URI("https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/" +
                ERB::Util.url_encode(address) + "?unitGroup=us&"+
                "key=" + ENV['VISUAL_CROSSING_API_KEY'] +
                "&contentType=json")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-api-key"] = ENV["SYGIC_API_KEY"]
    request["cache-control"] = 'no-cache'

    response = http.request(request)
    return WeatherResult.new(response.read_body)
  end
end