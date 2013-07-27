status_cake_alarm
=================

An alarm to attract your attention when your web server goes down.
* Fetches status using [StatusCake](https://www.statuscake.com/).
* Shows current status and when the last check was performed.
* Last checked time is updated per minute.
* If the site goes down, the page turns red and plays an alarm.

![Screen Shot](screen_shot.png)

# Setting up

* Copy `config/conf.yml.example` to `config/conf.yml`
* Add config values
* Run `bundle install`
* Run `./alarm.rb` to start the app.
* Set up your browser to refresh the page in a frequency you want. You probably want a plugin like [this](https://chrome.google.com/webstore/detail/auto-refresh-plus/oilipfekkmncanaajkapbpancpelijih?hl=en).
