/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.view {
import sm.SocialMedia;

public interface IHeader extends IHandy{
    function getTag () :String;
    function clearInput () :void;
    function activateSocialMedia (vector:Vector.<SocialMedia>) :void

}
}
