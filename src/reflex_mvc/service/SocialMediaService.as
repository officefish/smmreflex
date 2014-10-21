/**
 * Created by root on 10/15/14.
 */
package reflex_mvc.service {
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.net.URLLoader;

import org.flaircode.oauth.OAuth;
import org.iotashan.oauth.OAuthToken;
import org.robotlegs.mvcs.Actor;

import reflex_mvc.events.SocialMediaServiceEvent;
import reflex_mvc.model.photo.Photo;

public class SocialMediaService extends Actor implements ISocialMediaService {

    private var _oauth:OAuth;
    private var _accessToken:OAuthToken;
    protected var loader:URLLoader;

    public function SocialMediaService () :void {
        loader = new URLLoader();
        loader.addEventListener(Event.COMPLETE, onComplete);
        loader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
    }

    private function onComplete (event:Event) :void {
        parseData(loader.data);
    }

    public function parseData (data:Object) :void {

    }

    public function get oauth () :OAuth {
        if (!_oauth) {
            if (_accessToken != null) {
                _oauth = new OAuth(_accessToken.key, _accessToken.secret);
            } else {
                _oauth = new OAuth();
            }


        }
        return _oauth;
    }
    public function searchPhoto (tag:String, ...params) :void {
        dispatch(new SocialMediaServiceEvent(SocialMediaServiceEvent.SEARCH_PROGRESS, {photos:new Vector.<Photo>}));
    }

    public function onIOError (event:IOErrorEvent) :void {
        trace('IOErrorEvent catched in service ' + serviceName);
        dispatch(new SocialMediaServiceEvent(SocialMediaServiceEvent.SEARCH_PROGRESS, {photos:new Vector.<Photo>}));

    }

    public function get authorised () :Boolean {
        return false;
    }
    public function set authorised (value:Boolean) :void {

    }

    public function get accessToken () :OAuthToken {
        return _accessToken;
    }
    public function set accessToken (value:OAuthToken) :void {
        _accessToken = value;
        oauth.consumerKey = _accessToken.key;
        oauth.consumerSecret = _accessToken.secret;
    }

    public function get serviceName () :String {
        return '';
    }



}
}
