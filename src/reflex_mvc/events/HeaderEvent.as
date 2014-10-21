/**
 * Created by root on 10/15/14.
 */
package reflex_mvc.events {
import flash.events.Event;

public class HeaderEvent extends Event {

    public static const SEARCH:String = 'search';
    public static const FOCUS:String = 'headerfocusIn';
    public static const FOCUS_OUT:String = 'headerfocusOut';

    public function HeaderEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable)
    }

    override public function clone():Event {
        return new HeaderEvent(type, bubbles, cancelable)
    }
}

}