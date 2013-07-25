class PageHelper
  def self.green_page(str)
    page(str, "green")
  end

  def self.red_page(str)
    page(str, "red")
  end

  def self.yellow_page(str)
    page(str, "yellow")
  end

  def self.page(str, color)
  <<-HTML
<html>
  <head>
    <title>
      Status Cake Alarm
    </title>
  </head>
  <body style="background: #{color}">
    <div class='stats'>
      #{str}
    </div>
  </body>
</html>
HTML
  end
end
