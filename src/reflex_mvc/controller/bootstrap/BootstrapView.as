/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.controller.bootstrap {

import org.robotlegs.core.IMediatorMap;

import reflex_mvc.view.AlertView;
import reflex_mvc.view.ExitPreviewButton;

import reflex_mvc.view.Footer;

import reflex_mvc.view.GalleryCooler;
import reflex_mvc.view.Header;
import reflex_mvc.view.NextButton;
import reflex_mvc.view.PhotoStackItem;
import reflex_mvc.view.PreviousButton;
import reflex_mvc.view.PreviousButton;
import reflex_mvc.view.mediator.AlertMediator;
import reflex_mvc.view.mediator.ExitPreviewButtonMediator;
import reflex_mvc.view.mediator.FooterMediator;
import reflex_mvc.view.mediator.GalleryCoolerMediator;
import reflex_mvc.view.mediator.HeaderMediator;
import reflex_mvc.view.mediator.NextButtonMediator;
import reflex_mvc.view.mediator.PreviousButtonMediator;
import reflex_mvc.view.mediator.SocialMediaButtonMediator;
import reflex_mvc.view.mediator.StackItemMediator;

import sm.SocialMediaButton;

public class BootstrapView {
    public function BootstrapView(mediatorMap:IMediatorMap) {
        mediatorMap.mapView(GalleryCooler, GalleryCoolerMediator);
        mediatorMap.mapView(Header, HeaderMediator);
        mediatorMap.mapView(Footer, FooterMediator);
        mediatorMap.mapView(SocialMediaButton, SocialMediaButtonMediator);
        mediatorMap.mapView(AlertView, AlertMediator);
        mediatorMap.mapView(PhotoStackItem, StackItemMediator);
        mediatorMap.mapView(ExitPreviewButton, ExitPreviewButtonMediator);
        mediatorMap.mapView(NextButton, NextButtonMediator);
        mediatorMap.mapView(PreviousButton, PreviousButtonMediator);
    }
}
}
