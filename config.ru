require "rubygems"
require "bundler"
require 'json'
require 'rack/contrib'
require 'bundler/setup'
require File.dirname(__FILE__) + '/database'
require File.dirname(__FILE__) + '/server'

use Rack::Lint
use Rack::ShowException
use Rack::ContentLength
use Rack::Static, :root => File.dirname(__FILE__) + '/public',  :urls => ["/index.html", '/css', '/fonts', '/img', '/js']

run StatsApp.new
