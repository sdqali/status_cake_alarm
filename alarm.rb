#!/usr/bin/env ruby

require "rubygems"
require "sinatra"
require "yaml"
require File.join(settings.root, "lib", "status_cake_client")

set :server, 'webrick'
set :public_folder, "public"

CONFIG_FILE = File.join(settings.root, "config", "conf.yml")
SETTINGS = YAML.load_file(CONFIG_FILE)

set :port, SETTINGS["port"].to_i
SC_USERNAME = SETTINGS["username"]
SC_API_KEY = SETTINGS["api_key"]
SC_TEST_ID = SETTINGS["test_id"]

get "/" do
  StatusCakeClient.new(SC_USERNAME, SC_API_KEY).status_for(SC_TEST_ID)
end
