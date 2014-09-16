require_relative 'opening'
require_relative 'ghost_example'

java_import 'br.com.etyllica.EtyllicaFrame'

class Presentation < EtyllicaFrame
  field_accessor :w, :h

  def initialize
    super 960, 480
  end

  def startApplication
#    Opening.new w, h
    GhostExample.new w, h
  end
end

opening = Presentation.new
opening.init Project::RESOURCES

