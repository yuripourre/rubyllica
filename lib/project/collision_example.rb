java_import 'java.awt.Color'
java_import 'br.com.etyllica.core.context.Application'
java_import 'br.com.etyllica.core.event.GUIEvent'
java_import 'br.com.etyllica.layer.ImageLayer'
java_import 'br.com.etyllica.layer.BufferedLayer'
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

    @boo2 = ImageLayer.new "boo.png"
    @boo2.set_image_coordinates 68, 68
    @boo2.set_opacity 150
    @boo2.set_w 68
    @boo2.set_h 68

    @speed = 10

    update_at_fixed_rate 50
  end

  def timeUpdate now
    if @right_key
      @boo.set_offset_x @speed
    end
    if @left_key
      @boo.set_offset_x -@speed
    end
    if @up_key
      @boo.set_offset_y -@speed
    end
    if @down_key
      @boo.set_offset_y @speed
    end

    if @boo.colideRetangular @boo2
       @boo2.set_opacity 250
    elsif
       @boo2.set_opacity 150
    end
  end

  def draw g
    @background.draw g
    @boo.draw g
    @boo2.draw g
  end

  def updateMouse event
    @boo2.set_x event.get_x - @boo2.w/2
    @boo2.set_y event.get_y - @boo2.h/2
  end

  def updateKeyboard event
    if(event.is_key_down KeyEvent::TSK_RIGHT_ARROW)
      @right_key = true
    elsif(event.is_key_up KeyEvent::TSK_RIGHT_ARROW)
      @right_key = false
    end

    if(event.is_key_down KeyEvent::TSK_LEFT_ARROW)
      @left_key = true
    elsif(event.is_key_up KeyEvent::TSK_LEFT_ARROW)
      @left_key = false
    end

    if(event.is_key_down KeyEvent::TSK_UP_ARROW)
      @up_key = true
    elsif(event.is_key_up KeyEvent::TSK_UP_ARROW)
      @up_key = false
    end

    if(event.is_key_down KeyEvent::TSK_DOWN_ARROW)
      @down_key = true
    elsif(event.is_key_up KeyEvent::TSK_DOWN_ARROW)
      @down_key = false
    end

    if(event.isKeyDown KeyEvent::TSK_H)
      @boo.set_ximage 68
    elsif(event.isKeyDown KeyEvent::TSK_J)
      @boo.set_ximage 0
    end
  end

end
