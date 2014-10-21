/**
 * Created by root on 10/14/14.
 */
package sm {
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.filters.GlowFilter;
import flash.geom.Matrix;

import sm.SocialMedia;

public class SocialMediaButton extends Sprite {

    private var socialMedia:SocialMedia;
    private var activeFlag:Boolean = false;

    public function SocialMediaButton(socialMedia:SocialMedia, asset:Bitmap, size:uint) {
        this.socialMedia = socialMedia;
        var scaleIndex:Number = size/asset.width;
        var data:BitmapData = scaleBitmapData(asset.bitmapData, scaleIndex);
        addChild(new Bitmap(data));
        buttonMode = true;
    }

    private function scaleBitmapData(bitmapData:BitmapData, scale:Number):BitmapData {
        scale = Math.abs(scale);
        var width:int = (bitmapData.width * scale) || 1;
        var height:int = (bitmapData.height * scale) || 1;
        var transparent:Boolean = bitmapData.transparent;
        var result:BitmapData = new BitmapData(width, height, transparent);
        var matrix:Matrix = new Matrix();
        matrix.scale(scale, scale);
        result.draw(bitmapData, matrix);
        return result;
    }

    public function set active (value:Boolean) :void {
        if (value) {
            this.activeFlag = true;
            this.filters = [new GlowFilter(0x82CAFA, 0.8, 12, 12)]
        } else {
            this.activeFlag = false;
            this.filters = null;
        }
    }

    public function get active () :Boolean {
        return activeFlag;
    }

    public function getSocialMedia () :SocialMedia {
        return socialMedia;
    }

}
}
