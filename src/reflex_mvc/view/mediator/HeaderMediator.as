/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.view.mediator {
import org.robotlegs.mvcs.Mediator;

import reflex_mvc.events.GalleryEvent;

import reflex_mvc.events.HandlyEvent;
import reflex_mvc.events.HeaderEvent;
import reflex_mvc.events.ReflexContextEvent;

import reflex_mvc.view.IHeader;

public class HeaderMediator extends Mediator{
    [Inject(name="header")]
    public var header:IHeader;

    override public function onRegister () :void {
        header.addEventListener(HandlyEvent.STARTUP_COMPLETE, assetsLoaded);
        header.addEventListener(HeaderEvent.SEARCH, search);
        header.addEventListener(HeaderEvent.FOCUS, focus);
        header.addEventListener(HeaderEvent.FOCUS_OUT, focusOut);
    }

    override public function onRemove () :void {
        header.removeEventListener(HandlyEvent.STARTUP_COMPLETE, assetsLoaded);
    }

    private function assetsLoaded (event:HandlyEvent) :void {
        dispatch(new ReflexContextEvent(ReflexContextEvent.VIEW_INIT_PROGRESS))
    }

    private function search (event:HeaderEvent) :void {
        var e:GalleryEvent = new GalleryEvent(GalleryEvent.SEARCH);
        e.tag = header.getTag ();

        header.clearInput ();
        dispatch(e);
    }

    private function focus (event:HeaderEvent) :void {
        dispatch(event);
    }

    private function focusOut (event:HeaderEvent) :void {
        dispatch(event);
    }
}
}
