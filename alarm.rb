#!/usr/bin/env ruby

require "rubygems"
require "sinatra"
require "yaml"
require File.join(settings.root, "lib", "status_cake_client")
require File.join(settings.root, "lib", "page_helper")
require File.join(settings.root, "lib", "site_status")

set :server, 'webrick'
set :public_folder, "public"

CONFIG_FILE = File.join(settings.root, "config", "conf.yml")
SETTINGS = YAML.load_file(CONFIG_FILE)

set :port, SETTINGS["port"].to_i
SC_USERNAME = SETTINGS["username"]
SC_API_KEY = SETTINGS["api_key"]
SC_TEST_ID = SETTINGS["test_id"]
SC_TEST_NAME = SETTINGS["test_name"]

get "/" do
  status = StatusCakeClient.new(SC_USERNAME, SC_API_KEY).status_for(SC_TEST_ID)
  return PageHelper.yellow_page(status) unless (status[:code] == 200)
  if SiteStatus.new(status[:body]).is_up?
    PageHelper.new(SC_TEST_NAME).green_page(status)
  else
    PageHelper.new(SC_TEST_NAME).red_page(status)
  end
end
