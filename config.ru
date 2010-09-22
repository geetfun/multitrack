require "rubygems"
require "bundler"
require 'net/http'
require 'rexml/document'
require 'rack/contrib'
require 'sinatra/base'
require 'database'
require 'server'

Bundler.setup
require 'json'


use Rack::ContentLength
use Rack::Static, :root => File.dirname(__FILE__) + '/public',  :urls => ["/index.html", '/css', '/fonts', '/img', '/js']
run StatsApp.new
