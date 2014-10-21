/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.controller.bootstrap.commands.launch {
import flash.display.DisplayObject;

import org.robotlegs.mvcs.Command;

import reflex_mvc.view.Footer;
import reflex_mvc.view.IFooter;

import reflex_mvc.view.IGalleryCooler;
import reflex_mvc.view.IHeader;

public class InitViewCommand extends Command {

    [Inject(name="cooler")]
    public var cooler:IGalleryCooler;

    [Inject(name="header")]
    public var header:IHeader;

    [Inject(name="footer")]
    public var footer:IFooter;

    override public function execute():void {

        contextView.addChild(cooler as DisplayObject);
        contextView.addChild(header as DisplayObject);
        contextView.addChild(footer as DisplayObject);

        (footer as DisplayObject).y = contextView.stage.stageHeight - Footer.HEIGHT;
        trace((footer as DisplayObject).y)



        // All views are IHandly implementation which let us to easy startup, shutdown and destroy it
        // every IHandly has his own special arguments in configure() method. Call toStringConfigArgs() to see them.




        // configure and startup fun flare3D cooler;
        cooler.configure(contextView).startup();

        // configure and startup header InputBar;
        header.configure(contextView).startup();

        // configure and startup footer mind gallery;
        footer.configure(contextView).startup();

    }
}
}