require_relative 'image_example'
#require_relative 'animation_example'
#require_relative 'input_example'
#require_relative 'collision_example'
#require_relative 'ghost_volley'

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

