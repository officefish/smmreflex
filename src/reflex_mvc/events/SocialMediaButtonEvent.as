/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.events {
import flash.events.Event;

import sm.SocialMedia;

public class SocialMediaButtonEvent extends Event {

    private var socialMedia:SocialMedia;
    public static const CLICK:String = 'smb_click';

    public function SocialMediaButtonEvent(type:String, socialMedia:SocialMedia, bubbles:Boolean = false, cancelable:Boolean = false) {
        this.socialMedia = socialMedia;
        super(type, bubbles, cancelable)
    }

    public function getSocialMedia () :SocialMedia {
        return socialMedia;
    }

    override public function clone():Event {
        return new SocialMediaButtonEvent(type, socialMedia, bubbles, cancelable)
    }
}

}