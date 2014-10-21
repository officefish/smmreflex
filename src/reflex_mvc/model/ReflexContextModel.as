/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.model {
import flash.utils.Dictionary;

import org.iotashan.oauth.OAuthToken;
import org.robotlegs.mvcs.Actor;

import patterns.enumeration.Enumeration;

import reflex_mvc.events.ReflexContextEvent;

import sm.SocialMedia;

public class ReflexContextModel extends Actor{

    private var viewFlags:uint = 3;
    private var socialMediaFlags:Vector.<Boolean>;

    private var instagramAccessToken:String = '523542709.4d50a8d.566615925acd458a8a8469345e8ff257';

    private var _500px_key:String = '9t6xLpvekpBXpcnFLpolowbLqEF6QMk3ni8OABtk';
    private var _500px_secret:String = '1j1h8otmQag5lzjCB3FQaadNTVe3CDpPWUTPGIDf';

    private var accessTokens:Dictionary = new Dictionary();

    public function decrementView () :void {
        viewFlags --;
        if (!viewFlags) {
            dispatch(new ReflexContextEvent(ReflexContextEvent.VIEW_INIT_COMPLETE));
        }
    }

    public function getSocialMediaFlags () :Vector.<Boolean> {
        if (socialMediaFlags == null) {
            socialMediaFlags = new Vector.<Boolean>();
            var list:Vector.<Enumeration> =  Enumeration.getElementsList (SocialMedia);
            for (var i:int = 0; i < list.length; i++) {
                socialMediaFlags.push(false);
            }
        }
        return socialMediaFlags;
    }

    public function getActiveSocialMedia () :Vector.<SocialMedia> {

        var vector:Vector.<SocialMedia> = new Vector.<SocialMedia>();
        var list:Vector.<Enumeration> =  Enumeration.getElementsList (SocialMedia);
        var flags:Vector.<Boolean> = getSocialMediaFlags();
        var socialMedia:SocialMedia;

        for (var i:int = 0; i < list.length; i++) {
            socialMedia = list[i] as SocialMedia;
            if (flags[socialMedia.value])
            vector.push(socialMedia);
        }
        return vector;
    }

    public function radioSocialMedia (socialMedia:SocialMedia) :void {
        var flags:Vector.<Boolean> = getSocialMediaFlags();
        flags[socialMedia.value] = flags[socialMedia.value] ? false : true;
    }


}
}
