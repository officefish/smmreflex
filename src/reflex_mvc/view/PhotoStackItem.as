/**
 * Created by root on 10/20/14.
 */
package reflex_mvc.view {
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;

import reflex_mvc.model.photo.ShortPhotoData;

public class PhotoStackItem extends Sprite {

    private var data:ShortPhotoData;

    public function PhotoStackItem(bitmapData:BitmapData, data:ShortPhotoData) {
        this.data = data;

        var bitmap = new Bitmap(bitmapData)
        addChild(bitmap);

        buttonMode = true;
    }

    public function getData () :ShortPhotoData {
        return data;
    }
}
}
