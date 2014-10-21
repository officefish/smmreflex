/**
 * Created by root on 10/17/14.
 */
package reflex_mvc.model.photo {
import flash.display.BitmapData;

import sm.SocialMedia;

public class ShortPhotoData {

    public var socialMedia:SocialMedia;
    public var id:String;
    public var rawContent:BitmapData;

    public function ShortPhotoData(id:String) {
        this.id = id;
    }
}
}
