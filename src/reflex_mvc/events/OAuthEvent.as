/**
 * Created by root on 10/15/14.
 */
package reflex_mvc.events {
import flash.events.Event;

public class OAuthEvent extends Event {

    public static const SUCCESS:String = 'success';
    public static const ERROR:String = 'error';

    public function OAuthEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable)
    }

    override public function clone():Event {
        return new OAuthEvent(type, bubbles, cancelable)
    }
}

}