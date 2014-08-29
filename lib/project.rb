require 'java'
Dir["*.jar"].each { |jar| require jar }

module Project
  RESOURCES = "file:"+File.expand_path("../assets", __FILE__)
end

require_relative "project/hello"
