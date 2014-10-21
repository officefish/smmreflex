/**
 * Created by root on 10/21/14.
 */
package reflex_mvc.controller.bootstrap.commands.stack {
import org.robotlegs.mvcs.Command;

import reflex_mvc.view.IFooter;

public class PreviousSlideCommand extends Command {

    [Inject(name="footer")]
    public var footer:IFooter;

    override public function execute():void {
        footer.previous();
    }
}
}