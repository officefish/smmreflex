/**
 * Created by root on 10/21/14.
 */
package reflex_mvc.view {
import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.MouseEvent;

public class PreviousButton extends Sprite {


    [Embed(source ="../../../out/production/smm_reflex/assets/prev.jpg")] private var Previous:Class;
    [Embed(source ="../../../out/production/smm_reflex/assets/prevOver.jpg")] private var PreviousOver:Class;

    private var previous:Bitmap;
    private var previousOver:Bitmap;

    public function PreviousButton() {
        previous = new Previous as Bitmap;
        previousOver = new PreviousOver as Bitmap;
        addChild(previous);
        buttonMode = true;

        addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
        addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
    }

    private function onMouseOver (event:MouseEvent) :void {
        if (contains(previous)) removeChild(previous);
        addChild(previousOver);
    }

    private function onMouseOut (event:MouseEvent) :void {
        if (contains(previousOver)) removeChild(previousOver);
        addChild(previous);
    }
}
}
