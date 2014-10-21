/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.controller.bootstrap.commands.socialmedia {
import org.robotlegs.mvcs.Command;

import reflex_mvc.events.SocialMediaButtonEvent;

import reflex_mvc.model.ReflexContextModel;
import reflex_mvc.view.AlertView;

import sm.SocialMedia;

public class RadioSocialMediaCommand extends Command {

    [Inject (name='contextModel')]
    public var model:ReflexContextModel;

    [Inject (name='alert')]
    public var alert:AlertView;

    [Inject]
    public var event:SocialMediaButtonEvent;

    override public function execute():void {
        model.radioSocialMedia(event.getSocialMedia());

        var activeSocialMedia:Vector.<SocialMedia> = model.getActiveSocialMedia();
        if (activeSocialMedia.length && contextView.contains(alert)) {
            contextView.removeChild(alert);
            alert.clear ();
        }
    }
}
}