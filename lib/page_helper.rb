# -*- coding: utf-8 -*-
class PageHelper
  def initialize(test_name, test_id, last_check_time)
    @test_name = test_name
    @test_id = test_id
    @last_check_time = last_check_time
  end

  def green_page(str)
    page(str, "green", "Up ☺")
  end

  def red_page(str)
    page(str, "red", "Down ☹")
  end

  def yellow_page(str)
    page(str, "yellow")
  end

  def page(str, color, status=nil)
  <<-HTML
<html>
  <head>
    <title>
      Status Cake Alarm
    </title>
    <link rel="stylesheet" type="text/css" href="/stylesheets/app.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://timeago.yarp.com/jquery.timeago.js"></script>
  </head>
  <body style="background: #{color}">
    <div class="status">
      <div class="headline">
        #{@test_name} is #{status}
        <a href="https://www.statuscake.com/App/AllStatus.php?tid=#{@test_id}" target="_blank">   ↪</a>
      </div>
      <div class="last-checked">
        <h3>
          Last Tested At: <abbr class="timeago" title="#{@last_check_time}"> </abbr>
        </h3>
      </div>
      <p class="toggle">
        ►
      </p>
      <div class="detailed">
        #{str}
      </div>
    </div>
    <script type="text/javascript" src="/javascript/app.js"></script>
    <script type="text/javascript">
    </script>
  </body>
</html>
HTML
  end
end
