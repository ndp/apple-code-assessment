require "test_helper"

class WeatherControllerTest < ActionDispatch::IntegrationTest

  setup do
    json = {
      "resolvedAddress": "Right here",
      "currentConditions": {temp: 60, snowdepth: 0}
    }.to_json
    @api_result = WeatherResult.new(json)
  end

  test "should get index" do
    get weather_index_path
    assert_response 200
  end

  test "should report error if show not given any street address" do
    get weather_show_path
    assert_response :bad_request
  end

  test "should be success if street address param given" do
    WeatherApi.expects(:get_weather).with("123").returns(@api_result)

    get weather_show_path, params: { street_address: "123" }

    assert_response 200
  end

  test "should call API if street address param given" do
    WeatherApi.expects(:get_weather).with("123").returns(@api_result)

    get weather_show_path, params: { street_address: "123" }
  end

  test "should send an API WeatherResult to view" do
    WeatherApi.expects(:get_weather).with("123").returns(@api_result)

    get weather_show_path, params: { street_address: "123" }

    assert_equal @api_result, assigns(:weather)
  end

end
