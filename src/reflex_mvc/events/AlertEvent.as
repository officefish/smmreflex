/**
 * Created by root on 10/16/14.
 */
package reflex_mvc.events {
import flash.events.Event;

public class AlertEvent extends Event {

    public static const CONFIRM:String = 'confirm';

    public function AlertEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable)
    }

    override public function clone():Event {
        return new AlertEvent(type, bubbles, cancelable)
    }
}

}