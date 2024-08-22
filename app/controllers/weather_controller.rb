class WeatherController < ApplicationController
  def index
  end

  def show
    if params[:street_address].blank?
      render status: :bad_request
    else
      @weather = WeatherApi.get_weather(params[:street_address])
      render status: :ok
    end
  end
end
