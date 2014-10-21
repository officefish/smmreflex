package {

import flash.display.Sprite;
import flash.text.TextField;

import org.robotlegs.core.IContext;

import reflex_mvc.ReflexContext;

[SWF(width="1000", height="600", frameRate='60', backgroundColor='0x4444444')]
public class Main extends Sprite {

    private var context:IContext;

    public function Main() {

        initRobotlegs();
    }

    private function initRobotlegs () :void {
        new ReflexContext(this);
    }
}
}
