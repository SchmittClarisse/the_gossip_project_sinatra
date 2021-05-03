require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
$:.unshift File.expand_path("./../lib/views", __FILE__)
require 'controller'

run ApplicationController