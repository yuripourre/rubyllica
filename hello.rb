require 'java'
 
java_import 'javax.swing.JFrame'
java_import 'javax.swing.JPanel'

java_import 'java.awt.Color'
java_import 'java.awt.Dimension'

 
class MyPanel < JPanel
  def paintComponent(graphics)
    graphics.set_color Color::WHITE
    graphics.fill_rect 0, 0, 640, 480
    graphics.set_color Color::BLACK
    graphics.draw_string "Hello World!", 300, 200
  end
end

frame = JFrame.new 'Hello, Rubyllica!'
frame.size = Dimension.new 640, 480
frame.setDefaultCloseOperation JFrame::EXIT_ON_CLOSE
panel = MyPanel.new
frame.add panel
frame.visible = true
