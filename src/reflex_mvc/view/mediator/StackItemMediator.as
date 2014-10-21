/**
 * Created by root on 10/20/14.
 */
package reflex_mvc.view.mediator {
import flash.events.Event;
import flash.events.MouseEvent;

import org.robotlegs.mvcs.Mediator;

import reflex_mvc.events.StackEvent;

import reflex_mvc.view.PhotoStackItem;

public class StackItemMediator extends Mediator{

    [Inject]
    public var item:PhotoStackItem;

    override public function onRegister () :void {
        item.addEventListener(MouseEvent.CLICK, onItemClick)
    }

    override public function onRemove () :void {
        item.removeEventListener(MouseEvent.CLICK, onItemClick)
    }

    private function onItemClick (e:MouseEvent) :void {
        var event:StackEvent = new StackEvent(StackEvent.PREVIEW)
        event.shortPhotoData = item.getData();
        dispatch(event);
    }
}
}
