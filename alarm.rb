#!/usr/bin/env ruby

require "rubygems"
require "sinatra"
require "yaml"
require "logger"

require File.join(settings.root, "lib", "status_cake_client")
require File.join(settings.root, "lib", "page_helper")
require File.join(settings.root, "lib", "site_status")

set :server, 'webrick'
set :public_folder, "public"

CONFIG_FILE = File.join(settings.root, "config", "conf.yml")
SETTINGS = YAML.load_file(CONFIG_FILE)

configure do
  LOGGER = Logger.new(File.join(settings.root, "log", "app.log"))
end

set :port, SETTINGS["port"].to_i
SC_USERNAME = SETTINGS["username"]
SC_API_KEY = SETTINGS["api_key"]
SC_TEST_ID = SETTINGS["test_id"]
SC_TEST_NAME = SETTINGS["test_name"]

get "/" do
  status = StatusCakeClient.new(SC_USERNAME, SC_API_KEY, LOGGER).status_for(SC_TEST_ID)
  return PageHelper.new(SC_TEST_NAME, SC_TEST_ID, nil).yellow_page(status) unless (status[:code] == 200)
  site_status = SiteStatus.new(status[:body])
  page_helper = PageHelper.new(SC_TEST_NAME, SC_TEST_ID, site_status.last_check_time)
  if site_status.is_up?
    page_helper.green_page(status)
  else
    page_helper.red_page(status)
  end
end
