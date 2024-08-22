# Encapsulates the results of an API call to the Visual Crossing Weather API.
# Shows the rudiments of how data would be accessed, but obviously more
# methods and data could be added.
class WeatherResult
  def initialize(json, options = {})
    @json = JSON.parse(json)
    @cached = options[:cached] || false
    @error = options[:error] || @json["currentConditions"].blank? || false
  end

  def cached?
    @cached
  end

  def error?
    @error
  end

  def street_address
    @json["resolvedAddress"]
  end

  def temperature
    @error ? '?' : @json["currentConditions"]["temp"]
  end

  def snowdepth
    @error ? '?' : @json["currentConditions"]["snowdepth"]
  end

  # etc.
end

