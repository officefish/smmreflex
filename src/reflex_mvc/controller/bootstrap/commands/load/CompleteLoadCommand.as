/**
 * Created by root on 10/17/14.
 */
package reflex_mvc.controller.bootstrap.commands.load {
import org.robotlegs.mvcs.Command;

import reflex_mvc.events.SocialMediaServiceEvent;
import reflex_mvc.model.photo.ShortPhotoData;
import reflex_mvc.view.IGalleryCooler;

public class CompleteLoadCommand extends Command {

    [Inject]
    public var event:SocialMediaServiceEvent;

    [Inject(name="cooler")]
    public var cooler:IGalleryCooler;

    override public function execute():void {
        var assets:Vector.<ShortPhotoData> =  event.getData()['assets'];
        if (!assets.length) return;

        cooler.placeAssets(assets);


    }
}
}