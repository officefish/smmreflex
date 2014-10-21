/**
 * Created by root on 10/19/14.
 */
package reflex_mvc.controller.bootstrap.commands.cooler {
import org.robotlegs.mvcs.Command;

import reflex_mvc.view.IGalleryCooler;

public class UnblockCoolerControlsCommand extends Command {

    [Inject(name="cooler")]
    public var cooler:IGalleryCooler;

    override public function execute():void {
        //trace ('unblockCoolerControls');
        cooler.unblockControls();
    }
}
}