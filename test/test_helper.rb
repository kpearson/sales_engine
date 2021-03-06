 require 'simplecov'
 SimpleCov.start

lib_dir = File.expand_path("../lib", __dir__)
$LOAD_PATH.unshift(lib_dir)

gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/mock'
require 'minitest/spec'
require 'minitest/pride'
require 'bigdecimal'
require 'date'
require 'pry'


require_relative '../lib/sales_engine'
require_relative 'data'
# require_relative '../lib/date_handler'
