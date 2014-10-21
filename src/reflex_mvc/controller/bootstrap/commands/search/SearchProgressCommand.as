/**
 * Created by root on 10/16/14.
 */
package reflex_mvc.controller.bootstrap.commands.search {
import org.robotlegs.mvcs.Command;

import reflex_mvc.events.SocialMediaServiceEvent;
import reflex_mvc.model.SearchModel;
import reflex_mvc.model.photo.Photo;
import reflex_mvc.model.photo.Photo;
import reflex_mvc.service.ISocialMediaService;

public class SearchProgressCommand extends Command {

    [Inject]
    public var event:SocialMediaServiceEvent;

    [Inject (name='searchModel')]
    public var searchModel:SearchModel;


    override public function execute():void {

        var photos:Vector.<Photo> = event.getData()['photos']
        if (photos.length) {
            searchModel.stack = searchModel.stack.concat(getLimitedList(photos, 4));
        }

        var service:ISocialMediaService = searchModel.loop.shift();
        if (service) {
            service.searchPhoto(searchModel.tag);
        } else {
            dispatch(new SocialMediaServiceEvent(SocialMediaServiceEvent.SEARCH_COMPLETE, {}));
        }
    }

    private function getLimitedList (original:Vector.<Photo>, length:int) :Vector.<Photo> {
        var list:Vector.<Photo> = new Vector.<Photo>();
        var index:int;
        for (var i:int = 0; i < length; i ++) {
            if (!original.length) break;
             index = Math.floor(Math.random() * original.length - 1);
             list.push(original.splice(index, 1)[0]);
        }
        return list;
    }
}
}