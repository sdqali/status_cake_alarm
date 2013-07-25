require "rubygems"
require "httpclient"

class StatusCakeClient
  TEST_API = "https://www.statuscake.com/API/Tests/Details/"
  def initialize(username, api_key)
    @username = username
    @api_key = api_key
    @client = HTTPClient.new
    @headers = {
      "API" => api_key,
      "Username" => username
    }
  end

  def status_for(test_id)
    resp = @client.get test_url(test_id), nil, @headers
    resp.body
  end

  private
  def test_url(test_id)
    "#{TEST_API}?TestID=#{test_id}"
  end
end
