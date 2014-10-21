/**
 * Created by root on 10/20/14.
 */
package reflex_mvc.events {
import flash.events.Event;

import reflex_mvc.model.photo.ShortPhotoData;

public class StackEvent extends Event {

    private var _data:ShortPhotoData;

    public static const PREVIEW:String = 'preview';
    public static const CLOSE_PREVIEW:String = 'closePreview';
    public static const NEXT:String = 'nextItem';
    public static const PREVIOUS:String = 'previousItem';

    public function StackEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable)
    }

    public function set shortPhotoData (data:ShortPhotoData) :void {
        _data = data;
    }

    public function get shortPhotoData () :ShortPhotoData {
        return _data;
    }

    override public function clone():Event {
        var event:StackEvent = new StackEvent(type, bubbles, cancelable);
        event.shortPhotoData = shortPhotoData;
        return event;
    }


}

}