/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.view {
import reflex_mvc.model.photo.ShortPhotoData;

public interface IFooter extends IHandy{
    function add (data:ShortPhotoData) :void;
    function next () :void;
    function previous () :void;
}
}
