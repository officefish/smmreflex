/**
 * Created by root on 10/16/14.
 */
package reflex_mvc.model {
import org.robotlegs.mvcs.Actor;

import reflex_mvc.model.photo.Photo;

import reflex_mvc.service.ISocialMediaService;

public class SearchModel extends Actor {

    private var _loop:Vector.<ISocialMediaService>;
    private var _tag:String;
    private var _stack:Vector.<Photo>

    public function set loop (vector:Vector.<ISocialMediaService>) :void {
        this._loop = vector;
    }

    public function get loop ():Vector.<ISocialMediaService> {
        return _loop;
    }

    public function set tag (value:String) :void {
        this._tag = value;
    }
    public function get tag () :String {
        return _tag;
    }

    public function set stack (vector:Vector.<Photo>) :void {
        this._stack = vector;
    }

    public function get stack () :Vector.<Photo> {
        if (!_stack) _stack = new Vector.<Photo>();
        return _stack;
    }

    public function clear () :void {
        _stack = new Vector.<Photo>();
    }
}
}
