require_relative 'hello_application'

java_import 'br.com.etyllica.EtyllicaFrame'

class Hello < EtyllicaFrame
  field_accessor :w, :h

  def initialize
    super 800, 600
  end
  def startApplication
    setPath(Project::RESOURCES);
    HelloApplication.new w, h
  end
end

hello = Hello.new
hello.init

