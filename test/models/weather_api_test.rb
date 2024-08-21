


class WeatherApiTest < ActiveSupport::TestCase
  test "should use Net::HTTP to request weather" do
    a_result = '{"location":{"values":[{"temp": 50}]}}'
    a_response = stub(:read_body => a_result)
    Net::HTTP.any_instance.expects(:request).once.returns(a_response)

    response = WeatherApi.get_weather "400 Pennsylvania Ave NW, Washington, DC 20006"

    assert_instance_of WeatherResult, response
  end
end
