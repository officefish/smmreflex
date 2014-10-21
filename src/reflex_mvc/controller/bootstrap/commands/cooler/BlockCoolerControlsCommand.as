/**
 * Created by root on 10/19/14.
 */
package reflex_mvc.controller.bootstrap.commands.cooler {
import org.robotlegs.mvcs.Command;

import reflex_mvc.view.IGalleryCooler;

public class BlockCoolerControlsCommand extends Command {

    [Inject(name="cooler")]
    public var cooler:IGalleryCooler;

    override public function execute():void {
        //trace ('blockCoolerControls')
        cooler.blockControls();
    }
}
}