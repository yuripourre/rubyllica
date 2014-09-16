require_relative 'hello_application'

java_import 'br.com.etyllica.EtyllicaFrame'

class Presentation < EtyllicaFrame
  field_accessor :w, :h

  def initialize
    super 800, 600
  end

  def startApplication
    HelloApplication.new w, h
  end
end

opening = Presentation.new
opening.init Project::RESOURCES

