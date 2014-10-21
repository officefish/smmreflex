/**
 * Created by root on 10/16/14.
 */
package sm.parser {
import reflex_mvc.model.photo.Photo;

import sm.SocialMedia;


public class SM500pxParser {

   public static function parse (data:String) :Vector.<Photo> {
       var domain:String = 'http://500px.com';
       var vector:Vector.<Photo> = new <Photo>[]
       var photo:Photo;
       var meta:Object;
       var dump:Object = JSON.parse(data)
      // trace(dump['total_items']);
       var photos:Array = dump['photos'];
     //  trace (photos.length);
       for (var i:int = 0; i < photos.length; i++) {
           photo = new Photo();
           meta = photos[i];
           photo.url = convertSize(meta.image_url, 4);
           photo.name = meta.name;
           photo.description = meta.description;
           photo.width = meta.width;
           photo.height = meta.height;
           photo.socialMedia = SocialMedia.SM_500_PX;
           photo.likes = meta.positive_votes_count;
           photo.author = meta.user.username;
           photo.authorCity = meta.user.city;
           photo.authorCountry = meta.user.country;
           photo.authorPic = meta.user.userpic;
           vector.push(photo);

       }
       return vector;
   }

   private static function convertSize (str:String, size:int) :String {
       var parsedStr:String = '';
       var split:Array = str.split('/');

       split[split.length - 1] = strReplace(split[split.length - 1], '2', size.toString());


       parsedStr = split[0] + '/'
       for (var i:int = 1; i < split.length - 1; i ++) {
           parsedStr += split[i];
           parsedStr += '/'
       }

       parsedStr += split[split.length - 1];
       return parsedStr;
   }

   private static function strReplace(str:String, search:String, replace:String):String {
        return str.split(search).join(replace);
    }


// Error #2124: Неизвестный тип загруженного файла.
// URL: http://500px.com/photo/84250479/model-claudia-by-stefan-odermatt

}
}