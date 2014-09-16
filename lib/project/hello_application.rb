require_relative 'next_application'

java_import 'java.awt.Color'
java_import 'br.com.etyllica.context.Application'
java_import 'br.com.etyllica.core.event.Action'
java_import 'br.com.etyllica.core.event.GUIEvent'
java_import 'br.com.etyllica.gui.Button'
java_import 'br.com.etyllica.gui.label.TextLabel'
java_import 'br.com.etyllica.gui.label.MultiLangLabel'
java_import 'br.com.etyllica.i18n.Language'
java_import 'br.com.etyllica.layer.ImageLayer'
java_import 'br.com.etyllica.core.event.PointerEvent'
java_import 'br.com.etyllica.core.event.PointerState'

class HelloApplication < Application

  def load
    @layer = ImageLayer.new 0, 0, "bg.png"

    texts = Hash.new

    texts[Language::PORTUGUESE_BRAZIL] = "Iniciar Apresentacao!"
    texts[Language::ENGLISH_USA] = "Start Presentation!"
    texts[Language::JAPANESE] = "プレゼンテーションを開始"

    @button = Button.new w/2-200/2, h/2-50/2+20, 200, 50
    @button.set_label MultiLangLabel.new texts
    @button.add_action GUIEvent::MOUSE_LEFT_BUTTON_UP,
                                Action.new(self, "start_presentation")
    add @button

    language_buttons_y = @button.y+240

    portuguese_button = Button.new @button.x-@button.w-10, language_buttons_y, 200, 50
    portuguese_button.set_label TextLabel.new "Portuguese"
    portuguese_button.add_action GUIEvent::MOUSE_LEFT_BUTTON_UP, 
                                Action.new(self, "changeLanguage",
                                           Language::PORTUGUESE_BRAZIL)
    add portuguese_button

    english_button = Button.new @button.x, language_buttons_y, 200, 50
    english_button.set_label TextLabel.new "English"
    english_button.add_action GUIEvent::MOUSE_LEFT_BUTTON_UP, 
                                Action.new(self, "changeLanguage",
                                           Language::ENGLISH_USA)
    add english_button

    japanese_button = Button.new @button.x+@button.w+10, language_buttons_y, 200, 50
    japanese_button.set_label TextLabel.new "Japanese"
    japanese_button.add_action GUIEvent::MOUSE_LEFT_BUTTON_UP, 
                                Action.new(self, "changeLanguage",
                                           Language::JAPANESE)
    add japanese_button

  end

  def updateMouse event
    if event.getState == PointerState::CLICK
      if @button.on_mouse event
        set_next_application NextApplication.new w, h
      end
    end

    GUIEvent::NONE
  end

  def draw g
    @layer.draw g
  end
end
