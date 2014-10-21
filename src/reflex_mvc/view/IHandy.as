/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.view {
import flash.events.IEventDispatcher;

public interface IHandy extends IEventDispatcher{
    function startup () :IHandy;
    function shutdown () :IHandy;
    function configure (...args) :IHandy;
    function destroy () :IHandy;
    function toStringConfigArgs () :String;
}
}
