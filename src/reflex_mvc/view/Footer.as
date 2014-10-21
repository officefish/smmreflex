/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.view {
import fl.controls.Button;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextFormat;

import reflex_mvc.errors.HandyError;
import reflex_mvc.model.photo.ShortPhotoData;

public class Footer extends Handly implements IFooter {

    public static const HEIGHT:uint = 140;

    private var stack:PhotoStack;
    private var exportButton:Button;

    override public function toStringConfigArgs () :String {
        return '(contextView:DisplayObjectContainer)';
    }

    override public function configure (...args) :IHandy {
        var contextView:DisplayObjectContainer = args[0];
        if (!contextView) {
            throw new HandyError(HandyError.NO_DO_CONTAINER);
        }

        graphics.beginFill(0x222e3b, 1);
        graphics.drawRect(0,0,(contextView as Sprite).stage.stageWidth, HEIGHT);
        graphics.endFill();

        stack = new PhotoStack();
        stack.x = stack.y = 10;
        addChild(stack);

        var format:TextFormat = new TextFormat();
        format.font = 'Helvetica';
        format.size = 16;
        format.bold;

        exportButton = new Button();
        exportButton.width = 150;
        exportButton.height = 40;
        exportButton.y = 50;
        exportButton.x = 810;;
        exportButton.setStyle('textFormat', format);
        exportButton.label = 'Export to Dropbox';
        addChild(exportButton);

        return super.configure(args);

        //
    }

    override public function startup () :IHandy {
        return super.startup();
    }

    public function add (data:ShortPhotoData) :void {
        stack.add(data);
    }

    public function next () :void {
        stack.next();
    }

    public function previous () :void {
        stack.previous();
    }

}
}
