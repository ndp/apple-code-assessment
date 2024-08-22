
class WeatherApiTest < ActiveSupport::TestCase

  # Fake API key, so that tests don't require an ENV to be set.
  API_KEY = 'ABCetc'

  setup do
    Rails.cache.clear
    @original_api_key = ENV['VISUAL_CROSSING_API_KEY']
    ENV['VISUAL_CROSSING_API_KEY'] = API_KEY
  end

  teardown do
    ENV['VISUAL_CROSSING_API_KEY']  = @original_api_key
  end

  test "should use Net::HTTP to make an external API request" do
    a_result = '{"location":{"values":[{"temp": 50}]}}'
    a_response = stub(:read_body => a_result, code: '200')
    Net::HTTP.any_instance.expects(:request).once.returns(a_response)

    response = WeatherApi.get_weather "400 Pennsylvania Ave NW, Washington, DC 20006"

    assert_instance_of WeatherResult, response
  end

  test "request has API as query param" do

    a_response = mock(:read_body => '{}', code: '200')

    Net::HTTP.any_instance.expects(:request).with()  { |req|
      req.uri.query.include?(API_KEY)
    }.returns(a_response)

    WeatherApi.get_weather "123 Main St"
  end

  test "request has the street address (URL encoded) as part of the path" do
    a_response = stub(:read_body => '{}', code: '200')

    Net::HTTP.any_instance.expects(:request).with()  { |req|
      req.uri.path.include?('123%20Main%20St')
    }.returns(a_response)

    WeatherApi.get_weather "123 Main St"
  end

  test "should pull a result from the cache if it's there" do
    # Warm the cache
    a_response = stub(:read_body => '{ "foo": "bar" }', code: '200')
    Net::HTTP.any_instance.expects(:request)
             .once  # <== second call will be from cache
             .returns(a_response)
    WeatherApi.get_weather "123 Main St"

    # These all hit the cache
    WeatherApi.get_weather "123 Main St"
    WeatherApi.get_weather "123 Main St"
    WeatherApi.get_weather "123 Main St"
  end

  test "cached property of result is true or false" do
    a_response = stub(:read_body => '{ "foo": "bar" }', code: '200')
    Net::HTTP.any_instance.expects(:request)
             .once  # <== second call is cached
             .returns(a_response)
    result = WeatherApi.get_weather "123 Main St"
    assert_not result.cached?

    # Hit the cache
    result = WeatherApi.get_weather "123 Main St"
    assert result.cached?
  end

  test "returns error result if API call not successful" do
    a_response = stub(:read_body => '{}', code: '404')
    Net::HTTP.any_instance.expects(:request).returns(a_response)

    result = WeatherApi.get_weather "123 Main St"

    assert_instance_of WeatherResult, result
    assert result.error?
  end

end
