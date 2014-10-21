/**
 * Created by root on 10/16/14.
 */
package reflex_mvc.controller.bootstrap.commands.search {
import flash.display.DisplayObject;

import org.robotlegs.mvcs.Command;

import reflex_mvc.events.SocialMediaServiceEvent;

import reflex_mvc.view.AlertView;
import reflex_mvc.view.IFooter;
import reflex_mvc.view.IHeader;

public class SearchWarningCommand extends Command {

    [Inject (name='alert')]
    public var alert:AlertView;

    [Inject(name="header")]
    public var header:IHeader;

    [Inject(name="footer")]
    public var footer:IFooter;

    [Inject]
    public var event:SocialMediaServiceEvent;

    override public function execute():void {

        trace('searchWarningCommand')
        var width:int = contextView.stage.stageWidth;
        var height:int = (footer as DisplayObject).y - (header as DisplayObject).height;
        alert.y = (header as DisplayObject).height;

        alert.setSize(width, height);
        contextView.addChild(alert);

        alert.addWarning(event.getData()['warning'], event.getData()['suggestion'], event.getData()['confirm'], event.getData()['cancel']);
    }
}
}