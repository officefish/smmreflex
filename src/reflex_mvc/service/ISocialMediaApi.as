/**
 * Created by root on 10/15/14.
 */
package reflex_mvc.service {
public interface ISocialMediaApi {
    function set access_token (value:String) :void;
    function get access_token () :String;
    function callMethod (method:String, params:Object) :void;
}
}
