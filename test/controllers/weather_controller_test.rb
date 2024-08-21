require "test_helper"

class WeatherControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weather_index_path
    assert_response 200
  end

  test "should report error if show not given any address" do
    get weather_show_path
    assert_response :bad_request
  end

  test "should be success if address param given" do
    get weather_show_path, params: { address: "123" }
    assert_response 200
  end

  test "should call API if address param given" do
    WeatherApi.expects(:get_weather).with("123").returns({})

    get weather_show_path, params: { address: "123" }
  end

  test "should send API result to view" do
    WeatherApi.expects(:get_weather).with("123").returns({foo:'bar'})

    get weather_show_path, params: { address: "123" }

    assert_equal({foo:'bar'}, assigns(:weather))
  end

  test "should cache API result for 30 minutes" do
  end

end
