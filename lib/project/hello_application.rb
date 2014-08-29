java_import 'java.awt.Color'
java_import 'br.com.etyllica.context.Application'
java_import 'br.com.etyllica.layer.ImageLayer'

class HelloApplication < Application

  def load
    @layer = ImageLayer.new 0, 0, "bg.png"
  end

  def draw(g)
    @layer.draw g
  end

  def updateKeyboard event
  end

  def updateMouse event
  end

end

