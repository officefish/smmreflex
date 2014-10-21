/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.view.mediator {
import flash.events.MouseEvent;

import org.robotlegs.mvcs.Mediator;

import reflex_mvc.events.SocialMediaButtonEvent;

import sm.SocialMedia;

import sm.SocialMediaButton;

public class SocialMediaButtonMediator extends Mediator {

    [Inject] public var button:SocialMediaButton;

    override public function onRegister () :void {
        eventMap.mapListener(button, MouseEvent.CLICK, onButtonClick);
    }

    private function onButtonClick (event:MouseEvent) :void {
        var socialMedia:SocialMedia = button.getSocialMedia();
        button.active = !button.active;

        dispatch(new SocialMediaButtonEvent(SocialMediaButtonEvent.CLICK, socialMedia))
    }
}
}
