/**
 * Created by root on 10/15/14.
 */
package reflex_mvc.events {
import flash.events.Event;

import reflex_mvc.model.photo.ShortPhotoData;

public class GalleryEvent extends Event {

    public static const SEARCH:String = 'search';
    public static const SELECT:String = 'select';

    private var _tag:String;
    private var _data:ShortPhotoData;

    public function GalleryEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable)
    }

    public function set tag (value:String) :void {
        this._tag = value;
    }

    public function get tag () :String {
        return _tag;
    }

    public function set shortPhotoData (data:ShortPhotoData) :void {
        _data = data;
    }

    public function get shortPhotoData () :ShortPhotoData {
        return _data;
    }


    override public function clone():Event {
        var event:GalleryEvent = new GalleryEvent(type, bubbles, cancelable);
        event.shortPhotoData = shortPhotoData;
        event.tag = tag;
        return event;
    }
}

}