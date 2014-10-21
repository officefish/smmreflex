/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.view {
import flash.display.Sprite;

import reflex_mvc.events.HandlyEvent;

import reflex_mvc.view.IHandy;

public class Handly extends Sprite implements IHandy {

    public function toStringConfigArgs () :String {
        return '';
    }

    public function configure (...args) :IHandy {
        dispatchEvent(new HandlyEvent(HandlyEvent.CONFIGURE_COMPLETE));
        return this;

    }

    public function startup () :IHandy {
        dispatchEvent(new HandlyEvent(HandlyEvent.STARTUP_COMPLETE));
        return this;
    }

    public function  shutdown () :IHandy {
       return this;
    }

    public function destroy () :IHandy {
        // some code There to prepare this Handy to GC.
        return this;
    }
}
}
