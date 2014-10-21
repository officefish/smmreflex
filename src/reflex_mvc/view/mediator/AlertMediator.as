/**
 * Created by root on 10/16/14.
 */
package reflex_mvc.view.mediator {
import org.robotlegs.mvcs.Mediator;

import reflex_mvc.events.AlertEvent;

import reflex_mvc.view.AlertView;

public class AlertMediator extends Mediator {

    [Inject (name='alert')]
    public var alert:AlertView;

    override public function onRegister () :void {
        eventMap.mapListener(alert, AlertEvent.CONFIRM, confirm);
    }

    private function confirm (event:AlertEvent) :void {
        contextView.removeChild(alert);
        alert.clear ();
    }
}
}
