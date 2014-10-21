/**
 * Created by root on 10/14/14.
 */
package reflex_mvc {
import flash.display.DisplayObjectContainer;

import org.robotlegs.base.ContextEvent;

import org.robotlegs.mvcs.Context;

import reflex_mvc.controller.bootstrap.BootstrapClasses;
import reflex_mvc.controller.bootstrap.BootstrapController;
import reflex_mvc.controller.bootstrap.BootstrapModel;
import reflex_mvc.controller.bootstrap.BootstrapService;
import reflex_mvc.controller.bootstrap.BootstrapView;

public class ReflexContext extends Context {
    public function ReflexContext(contextView:DisplayObjectContainer) {
        super (contextView, true);
    }

    override public function startup () :void {
        configure();
        super.startup();
    }

    private function configure () :void {


        new BootstrapClasses(injector);
        new BootstrapController(commandMap);
        new BootstrapModel(injector);
        new BootstrapService(injector);
        new BootstrapView(mediatorMap);

    }
}
}
