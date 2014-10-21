/**
 * Created by root on 10/21/14.
 */
package reflex_mvc.view {
import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.MouseEvent;

public class NextButton extends Sprite {

    [Embed(source ="../../../out/production/smm_reflex/assets/next.jpg")] private var Next:Class;
    [Embed(source ="../../../out/production/smm_reflex/assets/nextOver.jpg")] private var NextOver:Class;

    private var next:Bitmap;
    private var nextOver:Bitmap;

    public function NextButton() {
        next = new Next as Bitmap;
        nextOver = new NextOver as Bitmap;
        addChild(next);
        buttonMode = true;

        addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
        addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
    }

    private function onMouseOver (event:MouseEvent) :void {
        if (contains(next)) removeChild(next);
        addChild(nextOver);
    }

    private function onMouseOut (event:MouseEvent) :void {
        if (contains(nextOver)) removeChild(nextOver);
        addChild(next);
    }
}
}
