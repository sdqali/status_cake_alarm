require "json"

class SiteStatus
  def initialize(resp)
    @resp = JSON.parse(resp)
  end

  def is_up?
    @resp['Status'] == 'Up'
  end
end
