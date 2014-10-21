/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.view {
import fl.controls.Button;
import fl.controls.TextInput;

import flash.display.Bitmap;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.FocusEvent;
import flash.events.MouseEvent;
import flash.text.TextFormat;

import patterns.enumeration.Enumeration;

import reflex_mvc.errors.HandyError;
import reflex_mvc.events.HandlyEvent;
import reflex_mvc.events.HeaderEvent;

import sm.SocialMediaFactory;
import sm.SocialMediaButton;
import sm.SocialMedia;

public class Header extends Handly implements IHeader {

    private var input:TextInput;
    private var searchButton:Button;

    private var pinterestIcon:SocialMediaButton;
    private var socialMediaButtons:Vector.<SocialMediaButton>

    override public function toStringConfigArgs () :String {
        return '(contextView:DisplayObjectContainer)';
    }

    override public function configure (...args) :IHandy {
        var contextView:DisplayObjectContainer = args[0];
        if (!contextView) {
            throw new HandyError(HandyError.NO_DO_CONTAINER);
        }

        graphics.beginFill(0x222e3b, 1);
        graphics.drawRect(0,0,(contextView as Sprite).stage.stageWidth, 100);
        graphics.endFill();

        configureControls();
        configureSMIcons();

        return super.configure(args);
    }

    private function configureControls () :void {
        var format:TextFormat = new TextFormat();
        format.font = 'Helvetica';
        format.size = 30;
        format.bold;

        input = new TextInput();
        input.width = 200;
        input.height = 40;
        input.x = 600;
        input.y = 30;
        input.setStyle('textFormat', format);
        input.addEventListener(FocusEvent.FOCUS_IN, onFocusIn);
        input.addEventListener(FocusEvent.FOCUS_OUT, onFocusOut);
        addChild(input);

        var searchFormat:TextFormat = new TextFormat();
        searchFormat.font = 'Helvetica';
        searchFormat.size = 16;
        searchFormat.bold;

        searchButton = new Button();
        searchButton.width = 120;
        searchButton.height = 40;
        searchButton.y = 30;
        searchButton.x = input.x + input.width + 20;
        searchButton.setStyle('textFormat', searchFormat);
        searchButton.label = 'Search';
        searchButton.addEventListener(MouseEvent.CLICK, onSearchClick)
        addChild(searchButton);

    }

    public function getTag () :String {
        return input.text;
    }

    public function clearInput () :void {
        input.text = '';
    }

    private function onSearchClick (event:MouseEvent) :void {
        dispatchEvent(new HeaderEvent(HeaderEvent.SEARCH));
    }

    private function configureSMIcons () :void {
        socialMediaButtons = new Vector.<SocialMediaButton>();
        var list:Vector.<Enumeration> =  Enumeration.getElementsList (SocialMedia);
        var icon:SocialMediaButton;
        var padding:uint = 20;
        var shift:uint = 100;
        for (var i:int = 0; i < list.length; i ++) {
            icon = SocialMediaFactory.newSocialMediaButton(list[i] as SocialMedia, 30);
            icon.y = 37;
            icon.x = input.x - (shift + (icon.width + padding) * i);
            icon.active = false;
            socialMediaButtons.push(icon);
            addChild(icon);
        }
    }

    override public function startup () :IHandy {
        return super.startup();
    }

    public function activateSocialMedia (vector:Vector.<SocialMedia>) :void {
        while (vector.length) {
            var sm:SocialMedia = vector.shift();
            for each (var button:SocialMediaButton in socialMediaButtons) {
                if (button.getSocialMedia() == sm) {
                    button.active = true;
                }
            }
        }
    }

    private function onFocusIn (event:FocusEvent) :void {
        dispatchEvent(new HeaderEvent(HeaderEvent.FOCUS));
    }

    private function onFocusOut (event:FocusEvent) :void {
        dispatchEvent(new HeaderEvent(HeaderEvent.FOCUS_OUT));
    }


}
}
