/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.controller.bootstrap {
import org.robotlegs.core.IInjector;

import reflex_mvc.service.BehanceService;
import reflex_mvc.service.FlickrService;

import reflex_mvc.service.InstagramService;
import reflex_mvc.service.PinterestService;
import reflex_mvc.service.SM_500pxService;
import reflex_mvc.service.TestService;
import reflex_mvc.service.TumblrService;
import reflex_mvc.service.TwitterService;

public class BootstrapService {

    public function BootstrapService(injector:IInjector) {
        injector.mapSingleton(InstagramService);
        injector.mapSingleton(SM_500pxService);
        injector.mapSingleton(TumblrService);
        injector.mapSingleton(BehanceService);
        injector.mapSingleton(PinterestService);
        injector.mapSingleton(FlickrService);
        injector.mapSingleton(TwitterService);
        injector.mapSingleton(TestService);
    }
}
}
