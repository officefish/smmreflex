/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.controller.bootstrap {
import org.robotlegs.core.IInjector;

import reflex_mvc.ReflexContext;
import reflex_mvc.model.PhotoDataModel;
import reflex_mvc.model.ReflexContextModel;
import reflex_mvc.model.SearchModel;

public class BootstrapModel {
    public function BootstrapModel(injector:IInjector) {
        injector.mapSingleton(ReflexContextModel, 'contextModel');
        injector.mapSingleton(SearchModel, 'searchModel');
        injector.mapSingleton(PhotoDataModel, 'photoDataModel');
    }
}
}
