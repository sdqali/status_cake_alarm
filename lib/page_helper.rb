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
    page(str, "red", "Down ☹", true)
  end

  def yellow_page(str)
    page(str, "gold", "Unknown")
  end

  private

  def page(str, color, status, alarm=nil)
  <<-HTML
<html>
  <head>
    <title>
      #{@test_name} Status
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

      #{audio_tags if alarm}

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

  def audio_tags
    <<-HTML
<audio autoplay="autoplay" controls="controls" loop="loop">
  <source src="/audio/fire_alarm.mp3" type="audio/mpeg">
  <source src="/audio/fire_alarm.wav" type="audio/wav">
</audio>
HTML
  end

end
