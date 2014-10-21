/**
 * Created by root on 10/20/14.
 */
package reflex_mvc.controller.bootstrap.commands.stack {
import org.robotlegs.mvcs.Command;

import reflex_mvc.events.StackEvent;

import reflex_mvc.view.StackPreview;

public class ImagePreviewCommand extends Command {

    [Inject (name='stackPreview')]
    public var preview:StackPreview;

    [Inject]
    public var event:StackEvent;

    override public function execute():void {
        preview.redraw(1000, contextView.height);
        contextView.addChild(preview);
        preview.preview(event.shortPhotoData);
    }
}
}