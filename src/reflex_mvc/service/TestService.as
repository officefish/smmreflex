/**
 * Created by root on 10/21/14.
 */
package reflex_mvc.service {
import flash.net.URLRequest;

import reflex_mvc.events.SocialMediaServiceEvent;
import reflex_mvc.model.photo.Photo;

import sm.parser.TestParser;

public class TestService extends SocialMediaService {

    override public function searchPhoto(tag:String, ...params):void {
        //trace('testService searchPhoto');
        //super.searchPhoto(tag);
        //loader.load(request);
        var request:URLRequest = new URLRequest('test.js');
        loader.load(request);
    }

    override public function parseData(data:Object):void {
        var photos:Vector.<Photo> = TestParser.parse(data as String);
        dispatch(new SocialMediaServiceEvent(SocialMediaServiceEvent.SEARCH_PROGRESS, {photos: photos}));
    }

    override public function get serviceName():String {
        return '500pxService';
    }
}
}
