class WeatherController < ApplicationController
  def index
  end

  def show

    @weather = WeatherApi.get_weather(params[:street_address])

    render status: (@weather.error? ? :bad_request : :ok)

  end
end
