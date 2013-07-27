require "json"

class SiteStatus
  def initialize(resp)
    @resp = JSON.parse(resp)
  end

  def is_up?
    @resp['Status'] == 'Up'
  end

  def last_check_time
    Time.parse(@resp['LastTested'] + ' UTC').iso8601
  end
end
