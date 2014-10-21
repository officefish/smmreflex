/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.view.mediator {
import flare.basic.Scene3D;

import flash.events.Event;

import org.robotlegs.mvcs.Mediator;

import reflex_mvc.events.GalleryEvent;

import reflex_mvc.events.HandlyEvent;
import reflex_mvc.events.ReflexContextEvent;

import reflex_mvc.view.GalleryCooler;

import reflex_mvc.view.IGalleryCooler;

public class GalleryCoolerMediator extends Mediator {

    [Inject(name="cooler")]
    public var cooler:IGalleryCooler;

    override public function onRegister () :void {
        cooler.addEventListener(HandlyEvent.STARTUP_COMPLETE, assetsLoaded);
        eventMap.mapListener(cooler, GalleryEvent.SELECT, onSelect);
    }

    override public function onRemove () :void {
        cooler.removeEventListener(HandlyEvent.STARTUP_COMPLETE, assetsLoaded);
    }

    private function assetsLoaded (event:HandlyEvent) :void {
        dispatch(new ReflexContextEvent(ReflexContextEvent.VIEW_INIT_PROGRESS))
    }

    private function onSelect (event:GalleryEvent) :void {
        dispatch(event);
    }
}
}
