# -*- coding: utf-8 -*-
class PageHelper
  def initialize(test_name)
    @test_name = test_name
  end

  def green_page(str)
    page(str, "green", "Up")
  end

  def red_page(str)
    page(str, "red", "Down")
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
  </head>
  <body style="background: #{color}">
    <div class="status">
      <div class="headline">
        #{@test_name} is #{status}
      </div>
      <p class="toggle">
        ►
      </p>
      <div class="detailed">
        #{str}
      </div>
    </div>
    <script type="text/javascript" src="/javascript/app.js"></script>
  </body>
</html>
HTML
  end
end
