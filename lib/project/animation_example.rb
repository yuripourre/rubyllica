java_import 'br.com.etyllica.core.context.Application'
java_import 'br.com.etyllica.core.event.GUIEvent'
java_import 'br.com.etyllica.layer.ImageLayer'
java_import 'br.com.etyllica.layer.AnimatedLayer'
java_import 'br.com.etyllica.core.event.PointerEvent'
java_import 'br.com.etyllica.core.event.PointerState'
java_import 'br.com.etyllica.core.event.KeyEvent'

class GhostExample < Application

  def load
    @background = ImageLayer.new "ghost_house.png"

    @boo = ImageLayer.new "boo.png"
    @boo.set_image_coordinates 68, 0
    @boo.set_w 68
    @boo.set_h 68
    @boo.centralize_x 0, w
    @boo.centralize_y 0, h

    @boo.set_opacity 150 #0~255
    @boo.set_scale 2
    @boo.set_angle -30

    @mini_boo = AnimatedLayer.new 40, 80, 16, 16, "miniboos.png"
    @mini_boo.set_speed 500
    @mini_boo.set_frames 2
    @mini_boo.set_scale 2
  end

  def update now
    @mini_boo.animate now
  end

  def draw g
    @background.draw g
    @boo.draw g
    @mini_boo.draw g
  end

end
