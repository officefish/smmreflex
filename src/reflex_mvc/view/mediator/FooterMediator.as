/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.view.mediator {
import org.robotlegs.mvcs.Mediator;

import reflex_mvc.events.HandlyEvent;
import reflex_mvc.events.ReflexContextEvent;
import reflex_mvc.view.IFooter;
import reflex_mvc.view.IHeader;

public class FooterMediator extends Mediator{
    [Inject(name="footer")]
    public var footer:IFooter;

    override public function onRegister () :void {
        //trace('onRegister')
        footer.addEventListener(HandlyEvent.STARTUP_COMPLETE, assetsLoaded);
        // eventMap.mapListener(cooler, HandlyEvent.CONFIGURE, assetsLoaded);
    }

    override public function onRemove () :void {
        footer.removeEventListener(HandlyEvent.STARTUP_COMPLETE, assetsLoaded);
    }

    private function assetsLoaded (event:HandlyEvent) :void {
        dispatch(new ReflexContextEvent(ReflexContextEvent.VIEW_INIT_PROGRESS))
    }
}
}
