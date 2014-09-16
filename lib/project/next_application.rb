java_import 'java.awt.Color'
java_import 'br.com.etyllica.context.Application'
java_import 'br.com.etyllica.core.event.GUIEvent'
java_import 'br.com.etyllica.layer.ImageLayer'
java_import 'br.com.etyllica.core.event.PointerEvent'
java_import 'br.com.etyllica.core.event.PointerState'

class NextApplication < Application

  def load
    puts "load()"
  end

  def draw g
    g.set_color Color::BLUE
    g.fill_rect 0,0,300,140
  end
end
