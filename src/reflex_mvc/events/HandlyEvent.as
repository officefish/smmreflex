/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.events {
import flash.events.Event;

public class HandlyEvent extends Event {

    public static const CONFIGURE_COMPLETE:String = 'handly_configure';
    public static const STARTUP_COMPLETE:String = 'startup_Complete';


    public function HandlyEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable)
    }

    override public function clone():Event {
        return new HandlyEvent(type, bubbles, cancelable)
    }
}

}