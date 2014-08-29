require 'java'
Dir["*.jar"].each { |jar| require jar }

require_relative "project/hello"
