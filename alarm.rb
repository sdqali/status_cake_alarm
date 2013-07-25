#!/usr/bin/env ruby

require "rubygems"
require "sinatra"
require "yaml"

set :public_folder, "public"

CONFIG_FILE = File.join(settings.root, "config", "conf.yml")
SETTINGS = YAML.load_file(CONFIG_FILE)

set :port, SETTINGS["port"].to_i

get "/" do
  "Hello"
end
