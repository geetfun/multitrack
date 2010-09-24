require "rubygems"
require "bundler"
require 'json'
require 'rack/contrib'
require 'bundler/setup'
require File.dirname(__FILE__) + '/database'
require File.dirname(__FILE__) + '/stats_app'
require File.dirname(__FILE__) + '/track_app'

use Rack::Lint
use Rack::ShowExceptions
use Rack::ContentLength

map '/track.js' do
  run TrackApp.new
end

map '/record.gif' do
  run StatsApp.new
end

map '/' do
  run lambda { [404, {'Content-Type' => 'text/plain'}, ['Not Found']] }
end



