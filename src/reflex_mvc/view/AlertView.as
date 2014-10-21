/**
 * Created by root on 10/16/14.
 */
package reflex_mvc.view {
import fl.controls.Button;

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFormat;

import flashx.textLayout.formats.TextAlign;

import mx.effects.MaskEffect;

import reflex_mvc.events.AlertEvent;

public class AlertView extends Sprite {

    private var warningFormat:TextFormat;
    private var suggestionFormat:TextFormat;
    private var warningBackgroundColor:uint = 0x82CAFA;

    private var confirmButton:Button;

    private var warningLabel:TextField;
    private var warningLabelFormat:TextFormat;

    public function AlertView() {
        warningFormat = new TextFormat();
        warningFormat.color = 0xFFFFFF;
        warningFormat.align = TextAlign.CENTER;
        warningFormat.size = 40;
        warningFormat.bold = true;
        warningFormat.font = 'Helvetica';

        suggestionFormat = new TextFormat();
        suggestionFormat.color = 0xFFFFFF;
        suggestionFormat.align = TextAlign.CENTER;
        suggestionFormat.size = 18;
        suggestionFormat.bold = true;
        suggestionFormat.font = 'Helvetica';

        warningLabelFormat = new TextFormat();
        warningLabelFormat.color = 0x222e3b;
        warningLabelFormat.align = TextAlign.CENTER;
        warningLabelFormat.size = 14;
        warningLabelFormat.bold = true;
        warningLabelFormat.font = 'Helvetica';

        warningLabel = new TextField();
        warningLabel.antiAliasType = AntiAliasType.ADVANCED;
        warningLabel.defaultTextFormat = warningLabelFormat;
        warningLabel.width = this.width;
        warningLabel.mouseEnabled = false;
        warningLabel.text = 'Warning';

        confirmButton = new Button();
        confirmButton.label = 'Accept';
        confirmButton.width = 120;
        confirmButton.height = 50;
        confirmButton.addEventListener(MouseEvent.CLICK, onConfirmClick);
    }

    private function onConfirmClick (event:MouseEvent) :void {
        dispatchEvent(new AlertEvent(AlertEvent.CONFIRM))
    }

    public function setSize (width:int, height:int) :void {
        graphics.clear();
        graphics.beginFill(warningBackgroundColor, 1);
        graphics.drawRect(0,0,width,height);
        graphics.endFill();
    }

    public function addWarning (warning:String, suggestion:String, confirmFlag:Boolean, cancelFlag:Boolean) :void {
        var widthIndex:int = this.width;
        var heightIndex:int = this.height;
        graphics.clear();
        graphics.beginFill(warningBackgroundColor, 1);
        graphics.drawRect(0,0,widthIndex,heightIndex);
        graphics.endFill();

        var warning_tf:TextField = new TextField();
        warning_tf.antiAliasType = AntiAliasType.ADVANCED;
        warning_tf.defaultTextFormat = warningFormat;
        warning_tf.width = this.width;
        warning_tf.y = Math.floor (this.height * 0.25);
        warning_tf.mouseEnabled = false;
        warning_tf.text = warning;
        addChild(warning_tf);

        var suggestion_tf:TextField = new TextField();
        suggestion_tf.antiAliasType = AntiAliasType.ADVANCED;
        suggestion_tf.defaultTextFormat = suggestionFormat;
        suggestion_tf.width = this.width;
        suggestion_tf.y = Math.floor (this.height * 0.45);
        suggestion_tf.mouseEnabled = false;
        suggestion_tf.text = suggestion;
        addChild(suggestion_tf);

        warningLabel.width = this.width;
        warningLabel.y = Math.floor (this.height * 0.1);
        addChild(warningLabel);


        if (confirmFlag) {
            confirmButton.x = (this.width - confirmButton.width) / 2;
            confirmButton.y = Math.floor (this.height * 0.7);
            addChild(confirmButton);
        }
    }

    public function clear () :void {
        while (numChildren) removeChildAt(0);
        graphics.clear();
    }
}
}
