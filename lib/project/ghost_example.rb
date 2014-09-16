java_import 'java.awt.Color'
java_import 'br.com.etyllica.context.Application'
java_import 'br.com.etyllica.core.event.GUIEvent'
java_import 'br.com.etyllica.layer.ImageLayer'
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

    update_at_fixed_rate 200
  end

  def draw g
    @background.draw g
    @boo.draw g
  end

  def updateKeyboard event
    if(event.is_key_down KeyEvent::TSK_RIGHT_ARROW)
      @boo.set_yimage 68
      @boo.set_angle 30
      @right_key = true
    elsif(event.is_key_up KeyEvent::TSK_RIGHT_ARROW)
      @right_key = false
    end

    if(event.is_key_down KeyEvent::TSK_LEFT_ARROW)
      @boo.set_yimage 0
      @boo.set_angle -30
      @left_key = true
    elsif(event.is_key_up KeyEvent::TSK_LEFT_ARROW)
      @left_key = false
    end

    if(event.isKeyDown KeyEvent::TSK_H)
      @boo.set_ximage 68
    elsif(event.isKeyDown KeyEvent::TSK_J)
      @boo.set_ximage 0
    end
  end

  def timeUpdate now
    if @right_key
      @boo.set_offset_x 2
    end
    if @left_key
      @boo.set_offset_x -2
    end
  end
end
