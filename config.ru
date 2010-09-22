require "rubygems"
require "bundler"
require 'json'
require 'rack/contrib'
require File.dirname(__FILE__) + '/database'
require File.dirname(__FILE__) + '/server'

Bundler.setup

use Rack::ContentLength
use Rack::Static, :root => File.dirname(__FILE__) + '/public',  :urls => ["/index.html", '/css', '/fonts', '/img', '/js']
run StatsApp.new
