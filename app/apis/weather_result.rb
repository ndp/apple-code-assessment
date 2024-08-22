class WeatherResult
  def initialize(json, options = {})
    @json = JSON.parse(json)
    @cached = options[:cached] || false
    @error = options[:error] || false
  end

  def cached?
    @cached
  end

  def error?
    @error
  end


  def temperature
    @json["currentConditions"]["temp"]
  end

  def snowdepth
    @json["currentConditions"]["snowdepth"]
  end

  # etc.
end

