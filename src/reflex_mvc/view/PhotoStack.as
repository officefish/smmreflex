/**
 * Created by root on 10/20/14.
 */
package reflex_mvc.view {
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.geom.Matrix;

import reflex_mvc.model.photo.ShortPhotoData;

public class PhotoStack extends Sprite {

    private var shiftWidth:int = 0;
    private var container:Sprite;

    private var nextButton:NextButton;
    private var previousButton:PreviousButton;

    private var containerMask:Sprite;

    private var containerShift:int = 0;
    private var itemIndex:int = 0;
    private var items:Array;

    public function PhotoStack() {
        nextButton = new NextButton();
        nextButton.x = 750;
        //addChild(next);

        previousButton = new PreviousButton();
        previousButton.x = 10;
        nextButton.y = previousButton.y = 10;
       // addChild(previous);

        container = new Sprite();
        container.x = 50;
        addChild(container);

        containerMask = new Sprite();
        containerMask.graphics.beginFill(0xff0000, 0.5);
        containerMask.graphics.drawRect(0,0,690,120);
        containerMask.graphics.endFill();
        containerMask.x = 50;
        container.mask = containerMask;
        addChild(containerMask);
        items = [];

    }

    public function add (data:ShortPhotoData) :void {
        var item:PhotoStackItem = new PhotoStackItem(proportionalHeightData(data.rawContent, 120), data);
        item.x = shiftWidth;
        shiftWidth = (item.width + 10 + shiftWidth);
        container.addChild(item);
        
        items.push(item);

        if ((container.width + containerShift) > containerMask.width) {
            addChild(nextButton);
        }


    }

    public function proportionalHeightData (data:BitmapData, tranformHeight:int) :BitmapData {
        var index:Number = tranformHeight / data.height;
        var matrix:Matrix = new Matrix();
        matrix.scale(index, index);
        var smallBMD:BitmapData = new BitmapData(data.width * index, data.height * index, true, 0x000000);
        smallBMD.draw(data, matrix, null, null, null, true);
        return smallBMD;
    }

    public function next () :void {
        itemIndex ++;

        if (itemIndex >= items.length) {
            itemIndex --;
            if (contains(nextButton)) removeChild(nextButton);
            return;
        }

        var item:DisplayObject = items[itemIndex - 1];
        containerShift -= (item.width + 10);
        container.x = 50 + containerShift;

        if (contains(nextButton)) removeChild(nextButton);
        addChild(previousButton);
        if ((container.width + containerShift) > containerMask.width) {
            addChild(nextButton);
        }

    }

    public function previous () :void {
        itemIndex --;
        if (itemIndex < 0) {
            itemIndex ++;
            if (contains(previousButton)) removeChild(previousButton);
            return;
        }

        var item:DisplayObject = items[itemIndex];
        containerShift += (item.width + 10);
        container.x = 50 + containerShift;

        if (containerShift == 0 || itemIndex == 0) {
            if (contains(previousButton)) removeChild(previousButton);
        }
        if ((container.width + containerShift) > containerMask.width) {
            addChild(nextButton);
        }

    }
}
}
