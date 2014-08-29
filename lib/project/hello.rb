require_relative 'hello_application'

java_import 'br.com.etyllica.EtyllicaFrame'

class Hello < EtyllicaFrame
  field_accessor :w, :h

  def initialize
    super 640, 480
  end
  def startApplication
    HelloApplication.new w, h
  end
end

hello = Hello.new
hello.init

