/**
 * Created by root on 10/21/14.
 */
package reflex_mvc.view {

import flash.display.Bitmap;
import flash.display.Sprite;

public class ExitPreviewButton extends Sprite {
    [Embed(source ="../../../out/production/smm_reflex/assets/exit.jpg")] private var Exit:Class;


    public function ExitPreviewButton () {
        var asset:Bitmap = new Exit as Bitmap;
        addChild(asset);
        buttonMode = true;
    }
}
}
