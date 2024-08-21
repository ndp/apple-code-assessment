
class WeatherResult
  def initialize(json)
   @json = JSON.parse(json)
  end

  def temperature
    @json["currentConditions"]["temp"]
  end

  def snowdepth
    @json["currentConditions"]["snowdepth"]
  end

  # etc.
end