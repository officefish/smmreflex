/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.controller.bootstrap.commands.launch {
import org.robotlegs.mvcs.Command;

import reflex_mvc.model.ReflexContextModel;

public class InitViewProgressCommand extends Command {


    [Inject (name='contextModel')]
    public var model:ReflexContextModel;

    override public function execute():void {
        model.decrementView();
    }
}
}