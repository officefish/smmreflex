/**
 * Created by root on 10/16/14.
 */
package reflex_mvc.controller.bootstrap.commands.search {
import org.robotlegs.mvcs.Command;

import reflex_mvc.model.PhotoDataModel;

import reflex_mvc.model.SearchModel;

public class SearchCompleteCommand extends Command {

    [Inject (name='searchModel')]
    public var searchModel:SearchModel;

    [Inject (name='photoDataModel')]
    public var dataModel:PhotoDataModel;


    override public function execute():void {
        dataModel.loadPhotos(searchModel.stack);
        searchModel.clear();

    }
}
}