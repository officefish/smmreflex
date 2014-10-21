/**
 * Created by root on 10/20/14.
 */
package reflex_mvc.controller.bootstrap.commands.stack {
import org.robotlegs.mvcs.Command;

import reflex_mvc.events.GalleryEvent;

import reflex_mvc.model.PhotoDataModel;
import reflex_mvc.view.IFooter;

public class AddItemToStackCommand extends Command {

    [Inject (name='photoDataModel')]
    public var dataModel:PhotoDataModel;

    [Inject]
    public var event:GalleryEvent;

    [Inject(name="footer")]
    public var footer:IFooter;


    override public function execute():void {
       footer.add(event.shortPhotoData);
    }
}
}