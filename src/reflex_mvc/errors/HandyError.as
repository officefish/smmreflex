/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.errors {
public class HandyError extends Error{

    public static const NOT_CONFIGURE:String = 'You should configure GalleryCooler before startup it. Set main DisplayObjectContainer as first argument in configure() method';
    public static const NO_DO_CONTAINER:String = 'First argument is not DisplayObjectContainer';


    public function HandyError(message:* = '', id:int = 0) {
        super (message, id);
    }
}
}
