/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.view {
import flash.display.DisplayObjectContainer;

import reflex_mvc.model.photo.ShortPhotoData;

public interface IGalleryCooler extends IHandy{
    function placeAssets (assets:Vector.<ShortPhotoData>) :void;
    function blockControls () :void;
    function unblockControls () :void;
}
}
