require 'bundler'
Bundler.require :default, ENV['RACK_ENV']

APP_HOME = File.expand_path("../", __FILE__)
require File.join(APP_HOME, "config", "boot")

run Truss::Router
