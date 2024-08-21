class WeatherController < ApplicationController
  def index
  end

  def show
    if params[:address].blank?
      render status: :bad_request
    else
      @weather = WeatherApi.get_weather(params[:address])
      render status: :ok
    end
  end
end
