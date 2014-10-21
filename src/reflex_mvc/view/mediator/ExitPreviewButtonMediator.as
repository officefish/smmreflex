/**
 * Created by root on 10/21/14.
 */
package reflex_mvc.view.mediator {
import flash.events.MouseEvent;

import org.robotlegs.mvcs.Mediator;

import reflex_mvc.events.StackEvent;

import reflex_mvc.view.ExitPreviewButton;

public class ExitPreviewButtonMediator extends Mediator {

    [Inject]
    public var button:ExitPreviewButton;

    override public function onRegister () :void {
        button.addEventListener(MouseEvent.CLICK, onClick);
    }

    private function onClick (event:MouseEvent) :void {
        dispatch(new StackEvent(StackEvent.CLOSE_PREVIEW));
    }

}
}
