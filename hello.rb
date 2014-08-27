require 'java'
require 'hello_application'

Dir["libs/*.jar"].each { |jar| require jar }

java_import 'br.com.etyllica.EtyllicaFrame'

class Hello < EtyllicaFrame
  def initialize
    super 640, 480
  end
  def start_application
    HelloApplication.new w h
  end
  def lol
    puts "hello!"
  end
end

#hello = Hello.new
#hello.lol
#hello.init
