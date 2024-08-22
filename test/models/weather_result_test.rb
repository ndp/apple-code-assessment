

class WeatherResultTest < ActiveSupport::TestCase

  test "returns the current temperature" do
    result = WeatherResult.new(EXAMPLE_RESULT)
    assert_equal 60, result.temperature
  end

  test "returns the current snow depth" do
    result = WeatherResult.new(EXAMPLE_RESULT)
    assert_equal 0, result.snowdepth
  end

  test "is not cached by default" do
    result = WeatherResult.new(EXAMPLE_RESULT)
    assert_not result.cached?
  end

  test "is tagged as cached if option is passed" do
    result = WeatherResult.new(EXAMPLE_RESULT, cached: true)
    assert result.cached?
  end

  test "can be tagged as error" do
    result = WeatherResult.new('{}', error: true)
    assert result.error?
  end

end


EXAMPLE_RESULT = <<END
{
 "queryCost": 1,
 "latitude": 37.74247,
 "longitude": -122.42958,
 "resolvedAddress": "333 Day St, San Francisco, CA 94131, United States",
 "address": "331 Day, san francisco, ca",
 "timezone": "America/Los_Angeles",
 "tzoffset": -7,
 "description": "Similar temperatures continuing with no rain expected.",
 "days": [
  {
   "datetime": "2024-08-21",
   "datetimeEpoch": 1724223600,
   "tempmax": 67,
   "tempmin": 58,
   "temp": 61.8,
   "feelslikemax": 67,
   "feelslikemin": 58,
   "feelslike": 61.8,
   "dew": 56.5,
   "humidity": 83.3,
   "precip": 0,
   "precipprob": 6,
   "precipcover": 0,
   "preciptype": null,
   "snow": 0,
   "snowdepth": 0,
   "windgust": 25.3,
   "windspeed": 17.2,
   "winddir": 267.9,
   "pressure": 1016.6,
   "cloudcover": 40.8,
   "visibility": 9.3,
   "solarradiation": 256,
   "solarenergy": 22.1,
   "uvindex": 8,
   "severerisk": 10,
   "sunrise": "06:31:02",
   "sunriseEpoch": 1724247062,
   "sunset": "19:53:47",
   "sunsetEpoch": 1724295227,
   "moonphase": 0.57,
   "conditions": "Partially cloudy",
   "description": "Clearing in the afternoon.",
   "icon": "partly-cloudy-day",
   "stations": [
    "E5830",
    "KSFO",
    "KHWD",
    "KOAK"
   ],
   "source": "comb",
   "hours": [
    {
     "datetime": "12:00:00",
     "datetimeEpoch": 1724266800,
     "temp": 65,
     "feelslike": 65,
     "humidity": 78.02,
     "dew": 58,
     "precip": 0,
     "precipprob": 1,
     "snow": 0,
     "snowdepth": 0,
     "preciptype": null,
     "windgust": 15,
     "windspeed": 10.3,
     "winddir": 260,
     "pressure": 1017,
     "visibility": 10.1,
     "cloudcover": 35,
     "solarradiation": 748,
     "solarenergy": 2.7,
     "uvindex": 7,
     "severerisk": 10,
     "conditions": "Partially cloudy",
     "icon": "partly-cloudy-day",
     "stations": null,
     "source": "fcst"
    },
    {
     "datetime": "13:00:00",
     "datetimeEpoch": 1724270400,
     "temp": 65.9,
     "feelslike": 65.9,
     "humidity": 75.62,
     "dew": 58,
     "precip": 0,
     "precipprob": 1,
     "snow": 0,
     "snowdepth": 0,
     "preciptype": null,
     "windgust": 17.2,
     "windspeed": 12.8,
     "winddir": 270,
     "pressure": 1017,
     "visibility": 10.1,
     "cloudcover": 27,
     "solarradiation": 827,
     "solarenergy": 3,
     "uvindex": 8,
     "severerisk": 10,
     "conditions": "Partially cloudy",
     "icon": "partly-cloudy-day",
     "stations": null,
     "source": "fcst"
    }
   ]
  }
 ],
 "alerts": [],
 "stations": {
  "E5830": {
   "distance": 1470,
   "latitude": 37.754,
   "longitude": -122.421,
   "useCount": 0,
   "id": "E5830",
   "name": "EW5830 San Francisco CA US",
   "quality": 0,
   "contribution": 0
  },
  "KHWD": {
   "distance": 28434,
   "latitude": 37.67,
   "longitude": -122.12,
   "useCount": 0,
   "id": "KHWD",
   "name": "KHWD",
   "quality": 100,
   "contribution": 0
  },
  "KSFO": {
   "distance": 15380,
   "latitude": 37.61,
   "longitude": -122.38,
   "useCount": 0,
   "id": "KSFO",
   "name": "KSFO",
   "quality": 100,
   "contribution": 0
  },
  "KOAK": {
   "distance": 18621,
   "latitude": 37.72,
   "longitude": -122.22,
   "useCount": 0,
   "id": "KOAK",
   "name": "KOAK",
   "quality": 100,
   "contribution": 0
  },
  "C5988": {
   "distance": 1930,
   "latitude": 37.76,
   "longitude": -122.432,
   "useCount": 0,
   "id": "C5988",
   "name": "CW5988 San Francisco CA US",
   "quality": 0,
   "contribution": 0
  },
  "F4637": {
   "distance": 3152,
   "latitude": 37.77,
   "longitude": -122.423,
   "useCount": 0,
   "id": "F4637",
   "name": "FW4637 San Francisco CA US",
   "quality": 0,
   "contribution": 0
  }
 },
 "currentConditions": {
  "datetime": "08:00:00",
  "datetimeEpoch": 1724252400,
  "temp": 60,
  "feelslike": 60,
  "humidity": 91.3,
  "dew": 57.4,
  "precip": 0,
  "precipprob": 0,
  "snow": 0,
  "snowdepth": 0,
  "preciptype": null,
  "windgust": 16.4,
  "windspeed": 8.9,
  "winddir": 285,
  "pressure": 1018,
  "visibility": 9.9,
  "cloudcover": 100,
  "solarradiation": 109,
  "solarenergy": 0.4,
  "uvindex": 1,
  "conditions": "Overcast",
  "icon": "cloudy",
  "stations": [
   "E5830",
   "KSFO",
   "C5988",
   "F4637"
  ],
  "source": "obs",
  "sunrise": "06:31:02",
  "sunriseEpoch": 1724247062,
  "sunset": "19:53:47",
  "sunsetEpoch": 1724295227,
  "moonphase": 0.57
 }
}
END