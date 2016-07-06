java_import 'br.com.etyllica.core.context.Application'
java_import 'br.com.etyllica.core.event.GUIEvent'
java_import 'br.com.etyllica.layer.ImageLayer'
java_import 'br.com.etyllica.layer.AnimatedLayer'
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

    @mini_boo = AnimatedLayer.new 40, 80, 16, 16, "miniboos.png"
    @mini_boo.set_speed 500
    @mini_boo.set_frames 2
    @mini_boo.set_scale 2

    @ball_speed = 10
    @ball_dx = 10
    @ball_dy = 0
    @ball_x = @mini_boo.x
    @ball_y = @mini_boo.y

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

    if @boo.colideRetangular @mini_boo
      calculate_angle @mini_boo, @boo
    end

    if @boo2.colideRetangular @mini_boo
      calculate_angle @mini_boo, @boo2
    end

    @mini_boo.animate now

    move_ball
  end

  def move_ball
    @ball_x += @ball_dx
    @ball_y += @ball_dy

    @mini_boo.set_x @ball_x
    @mini_boo.set_y @ball_y

    if (@mini_boo.x < 0 || @mini_boo.x > w)
      reset_ball
    end

    if (@mini_boo.y < 20 || @mini_boo.y > h)
      @ball_dy = -@ball_dy
    end

  end

  def reset_ball
    @ball_x = w/2
    @ball_y = h/2
    
    @ball_speed = 10
  end

  def calculate_angle (layer_a, layer_b)
		
    a_cx = layer_a.x+layer_a.w/2
    a_cy = layer_a.y+layer_a.h/2

    b_cx = layer_b.x+layer_b.w/2
    b_cy = layer_b.y+layer_b.h/2

    dx = a_cx - b_cx
    dy = a_cy - b_cy

    angle = Math.atan2(dy, dx)

    @ball_dx = -Math.sin(angle) * @ball_speed
    @ball_dy = -Math.cos(angle) * @ball_speed
  end


  def draw g
    @background.draw g
    @boo.draw g
    @boo2.draw g
    @mini_boo.draw g
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
