/**
 * Created by root on 10/20/14.
 */
package reflex_mvc.view {
import com.greensock.layout.AutoFitArea;

import flash.display.Bitmap;
import flash.display.Sprite;

import reflex_mvc.model.photo.ShortPhotoData;

public class StackPreview extends Sprite{

    private var exitButton:ExitPreviewButton;

    public function StackPreview() {
        exitButton = new ExitPreviewButton();
        exitButton.y = 10;
    }

    public function redraw (width:int, height:int) :void {
        graphics.clear();
        graphics.beginFill(0x222222, 0.7);
        graphics.drawRect(0,0,width,height);
        graphics.endFill();

    }

    public function preview (data:ShortPhotoData) :void {
        while (numChildren) removeChildAt(0);
        var bitmap:Bitmap = new Bitmap(data.rawContent);
        var area:AutoFitArea = new AutoFitArea(this,0,0,this.width,this.height,0x222222);
        addChild(bitmap);
        area.attach(bitmap);
        area.preview = true;
        exitButton.x = this.width - 40;
        addChild(exitButton);
    }
}
}
