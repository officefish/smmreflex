/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.controller.bootstrap {
import org.robotlegs.core.IInjector;

import reflex_mvc.view.AlertView;

import reflex_mvc.view.Footer;

import reflex_mvc.view.GalleryCooler;
import reflex_mvc.view.Header;
import reflex_mvc.view.IFooter;

import reflex_mvc.view.IGalleryCooler;
import reflex_mvc.view.IHeader;
import reflex_mvc.view.PhotoStackItem;
import reflex_mvc.view.StackPreview;

import sm.SocialMediaButton;

public class BootstrapClasses {

    public function BootstrapClasses(injector:IInjector) {
        injector.mapSingletonOf(IGalleryCooler, GalleryCooler, 'cooler');
        injector.mapSingletonOf(IFooter, Footer, 'footer');
        injector.mapSingletonOf(IHeader, Header, 'header');
        injector.mapSingletonOf(AlertView, AlertView, 'alert');
        injector.mapClass(SocialMediaButton, SocialMediaButton);
        injector.mapClass(PhotoStackItem, PhotoStackItem);
        injector.mapSingletonOf(StackPreview, StackPreview, 'stackPreview');
    }
}
}
