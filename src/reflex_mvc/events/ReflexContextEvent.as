/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.events {
import flash.events.Event;

public class ReflexContextEvent extends Event {

    public static const SERVICE_INIT_PROGRESS:String ='serviceInitProgress';
    public static const MODEL_INIT_PROGRESS:String = 'modelInitProgress';
    public static const VIEW_INIT_PROGRESS:String = 'viewInitProgress';
    public static const VIEW_INIT_COMPLETE:String = 'viewInitComplete';
    public static const MODEL_INIT_COMPLETE:String = 'modelInitComplete';
    public static const SERVICE_INIT_COMPLETE:String = 'serviceInitComplete';

    public function ReflexContextEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable)
    }

    override public function clone():Event {
        return new ReflexContextEvent(type, bubbles, cancelable)
    }
}

}