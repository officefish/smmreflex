/**
 * Created by root on 10/15/14.
 */
package reflex_mvc.controller.bootstrap.commands.launch {
import org.robotlegs.mvcs.Command;

import reflex_mvc.events.ReflexContextEvent;

import reflex_mvc.model.ReflexContextModel;

import reflex_mvc.service.InstagramService;

import reflex_mvc.service.SM_500pxService;

import sm.SocialMedia;

public class InitModelCommand extends Command {


    [Inject (name='contextModel')]
    public var model:ReflexContextModel;

    override public function execute():void {
        model.radioSocialMedia(SocialMedia.SM_500_PX);
        model.radioSocialMedia(SocialMedia.TEST);
        dispatch(new ReflexContextEvent(ReflexContextEvent.MODEL_INIT_COMPLETE));
    }
}
}