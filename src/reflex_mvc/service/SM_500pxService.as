/**
 * Created by root on 10/15/14.
 */
package reflex_mvc.service {
import flash.net.URLRequest;
import flash.net.URLRequestMethod;

import org.flaircode.oauth.OAuth;

import reflex_mvc.events.SocialMediaButtonEvent;

import reflex_mvc.events.SocialMediaServiceEvent;

import reflex_mvc.model.photo.Photo;

import sm.parser.SM500pxParser;

public class SM_500pxService extends SocialMediaService{


    public function SM_500pxService() {

    }

    override public function searchPhoto (tag:String, ...params) :void {

        var domain:String = 'https://api.500px.com/v1/';
        var path:String = 'photos/search';
        var url:String = domain + path;

        //var request:URLRequest = oauth.buildRequest(URLRequestMethod.GET, url, accessToken, {'tag':tag});
        //trace(request.url);
        //loader.load(request);

        var request:URLRequest = new URLRequest('http://127.0.0.1:8000/500px/photo/search/?tag=' + tag);
        //loader.load(request);
        super.searchPhoto(tag)
    }

    override public function parseData (data:Object) :void {
        var photos:Vector.<Photo> = SM500pxParser.parse(data as String);
        dispatch(new SocialMediaServiceEvent(SocialMediaServiceEvent.SEARCH_PROGRESS, {photos:photos}));
    }

    override public function get serviceName () :String {
        return '500pxService';
    }
}
}
