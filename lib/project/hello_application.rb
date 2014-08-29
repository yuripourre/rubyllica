java_import 'java.awt.Color'
java_import 'br.com.etyllica.context.Application'

class HelloApplication < Application

  def load
    puts "Application load"
  end

  def updateKeyboard event
  end

  def updateMouse event
  end

  def draw(graphics)
    graphics.set_color Color::BLUE
    graphics.fill_rect 0, 0, 640, 480
    graphics.set_color Color::BLACK
    graphics.draw_string "Hello World!", 300, 200
  end
end
