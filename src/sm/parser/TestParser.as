/**
 * Created by root on 10/21/14.
 */
package sm.parser {
import reflex_mvc.model.photo.Photo;


public class TestParser {

    public static function parse (data:String) :Vector.<Photo> {
        var vector:Vector.<Photo> = new <Photo>[]
        var dump:Object = JSON.parse(data)
        // trace(dump['total_items']);
        var photo:Photo;
        var meta:Object;
        var photos:Array = dump['photos'];
        //  trace (photos.length);
        for (var i:int = 0; i < photos.length; i++) {
            photo = new Photo();
            meta = photos[i];
            photo.url = meta.image_url;
            vector.push(photo);

        }
        return vector;
    }



}
}
