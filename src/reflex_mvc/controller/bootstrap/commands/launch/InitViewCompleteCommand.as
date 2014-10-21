/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.controller.bootstrap.commands.launch {
import org.iotashan.oauth.OAuthToken;
import org.robotlegs.mvcs.Command;

import reflex_mvc.model.ReflexContextModel;

import reflex_mvc.service.InstagramService;
import reflex_mvc.service.SM_500pxService;
import reflex_mvc.view.IHeader;

import sm.SocialMedia;

public class InitViewCompleteCommand extends Command {

    [Inject (name='contextModel')]
    public var model:ReflexContextModel;

    [Inject(name="header")]
    public var header:IHeader;

    override public function execute():void {
        var activeSocialMedia:Vector.<SocialMedia> = model.getActiveSocialMedia();
        header.activateSocialMedia(activeSocialMedia);
        trace('initViewCompleteCommand')

    }
}
}