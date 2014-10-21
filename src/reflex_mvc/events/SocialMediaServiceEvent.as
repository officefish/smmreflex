/**
 * Created by root on 10/16/14.
 */
package reflex_mvc.events {
import flash.events.Event;

public class SocialMediaServiceEvent extends Event {

    public static const SEARCH_PROGRESS:String = 'searchProgress';
    public static const SEARCH_COMPLETE:String = 'searchComplete';
    public static const NO_ACTIVE_SOCIAL_MEDIA:String = 'noActiveSocialMedia';
    public static const COMPLETE_LOAD:String = 'completeLoad';
    private var _data:Object;

    public function SocialMediaServiceEvent(type:String, data:Object, bubbles:Boolean = false, cancelable:Boolean = false) {
        this._data = data;
        super(type, bubbles, cancelable)
    }

    public function getData () :Object {
        return _data;
    }

    override public function clone():Event {
        return new SocialMediaServiceEvent(type, _data, bubbles, cancelable)
    }
}

}