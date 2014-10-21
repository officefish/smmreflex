/**
 * Created by root on 10/15/14.
 */
package reflex_mvc.service {
import org.flaircode.oauth.OAuth;
import org.iotashan.oauth.OAuthToken;

public interface ISocialMediaService {

    function get oauth () :OAuth;
    function searchPhoto (tag:String, ...params) :void;
    function get authorised () :Boolean;
    function set authorised (value:Boolean) :void;
    function get accessToken () :OAuthToken;
    function set accessToken (value:OAuthToken) :void;
    function parseData (data:Object) :void;
    function get serviceName () :String;

}
}
