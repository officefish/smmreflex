/**
 * Created by root on 10/16/14.
 */
package reflex_mvc.model.photo {
import flash.display.BitmapData;

import sm.SocialMedia;

public class Photo {

    public var url:String;
    public var name:String;
    public var description:String;
    public var width:int;
    public var height:int;
    public var likes:int;
    public var author:String;
    public var authorCity:String;
    public var authorCountry:String;
    public var authorPic:String;

    public var id:String;

    private var _short:ShortPhotoData;

    public function set rawContent (content:BitmapData):void {
        shortData.rawContent = content;
    }

    public function set socialMedia (media:SocialMedia):void {
        shortData.socialMedia = media;
    }



    public function Photo () :void {
        id = 'photo_' + counter;
        _short = new ShortPhotoData(id)
    }

    public function get shortData () :ShortPhotoData {
        return _short;
    }

    private static var _counter:int = 0;
    private static function get counter () :int {
        _counter ++;
        return _counter;
    }




}
}
