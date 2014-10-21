/**
 * Created by root on 10/21/14.
 */
package reflex_mvc.controller.bootstrap.commands.stack {
import org.robotlegs.mvcs.Command;

import reflex_mvc.view.StackPreview;

public class ClosePreviewCommand extends Command {

    [Inject (name='stackPreview')]
    public var preview:StackPreview;

    override public function execute():void {
        if (contextView.contains(preview)) {
            contextView.removeChild(preview);
        }
    }
}
}