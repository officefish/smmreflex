/**
 * Created by root on 10/16/14.
 */
package reflex_mvc.model {
import com.greensock.events.LoaderEvent;
import com.greensock.loading.DataLoader;
import com.greensock.loading.ImageLoader;
import com.greensock.loading.LoaderMax;
import com.greensock.loading.display.ContentDisplay;

import flash.display.Bitmap;

import flash.display.BitmapData;

import org.robotlegs.mvcs.Actor;

import reflex_mvc.events.SocialMediaServiceEvent;

import reflex_mvc.model.photo.Photo;
import reflex_mvc.model.photo.ShortPhotoData;

public class PhotoDataModel extends Actor {

    private var queue:LoaderMax;
    private var loading:Vector.<Photo>;
    private var cache:Object;

    public function PhotoDataModel() {
        queue = new LoaderMax({name: "mainQueue", onProgress: progressHandler, onComplete: completeHandler, onError: errorHandler});
        cache = {};

        //LoaderMax.prioritize("photo1");  //same as LoaderMax.getLoader("photo1").prioritize();
        //start loading
    }

    public function loadPhotos (photos:Vector.<Photo>) :void {
        loading = photos;
        var src:String;
        var asset:Photo;
        for (var i:int = 0; i < photos.length; i ++) {
            asset = photos[i];
            src = asset.url;
            queue.append(new ImageLoader(src, {name: src, format:"binary", allowMalformedURL:true, estimatedBytes: 2400}));

        }
        queue.load();
    }

    private function progressHandler(event:LoaderEvent):void {
            //trace("progress: " + event.target.progress);
        }

    private function completeHandler(event:LoaderEvent):void {
        var loaded:Vector.<ShortPhotoData> = new <ShortPhotoData>[];
        var src:String;
        var asset:Photo;
        var image:ContentDisplay;
        for (var i:int = 0; i < loading.length; i ++) {
            asset = loading[i];
            src = asset.url;
            image = queue.getContent(src);
            asset.rawContent = (image.rawContent as Bitmap).bitmapData;
            cache[asset.id] = asset;
            loaded.push(asset.shortData);
        }

        dispatch(new SocialMediaServiceEvent(SocialMediaServiceEvent.COMPLETE_LOAD, {'assets':loaded}));

    }

    private function errorHandler(event:LoaderEvent):void {
            trace("error occured with " + event.target + ": " + event.text);
    }

}
}
