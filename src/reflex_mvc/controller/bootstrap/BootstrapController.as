/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.controller.bootstrap {
import org.robotlegs.base.ContextEvent;
import org.robotlegs.core.ICommandMap;

import reflex_mvc.controller.bootstrap.commands.cooler.BlockCoolerControlsCommand;
import reflex_mvc.controller.bootstrap.commands.cooler.UnblockCoolerControlsCommand;

import reflex_mvc.controller.bootstrap.commands.launch.InitModelCommand;

import reflex_mvc.controller.bootstrap.commands.launch.InitViewCommand;
import reflex_mvc.controller.bootstrap.commands.launch.InitViewCompleteCommand;
import reflex_mvc.controller.bootstrap.commands.launch.InitViewProgressCommand;
import reflex_mvc.controller.bootstrap.commands.load.CompleteLoadCommand;
import reflex_mvc.controller.bootstrap.commands.search.SearchCompleteCommand;
import reflex_mvc.controller.bootstrap.commands.search.SearchProgressCommand;
import reflex_mvc.controller.bootstrap.commands.search.SearchWarningCommand;
import reflex_mvc.controller.bootstrap.commands.socialmedia.RadioSocialMediaCommand;
import reflex_mvc.controller.bootstrap.commands.search.StartSearchCommand;
import reflex_mvc.controller.bootstrap.commands.stack.AddItemToStackCommand;
import reflex_mvc.controller.bootstrap.commands.stack.ClosePreviewCommand;
import reflex_mvc.controller.bootstrap.commands.stack.ImagePreviewCommand;
import reflex_mvc.controller.bootstrap.commands.stack.NextSlideCommand;
import reflex_mvc.controller.bootstrap.commands.stack.PreviousSlideCommand;
import reflex_mvc.events.GalleryEvent;
import reflex_mvc.events.HeaderEvent;
import reflex_mvc.events.ReflexContextEvent;
import reflex_mvc.events.SocialMediaButtonEvent;
import reflex_mvc.events.SocialMediaServiceEvent;
import reflex_mvc.events.StackEvent;

public class BootstrapController {
    public function BootstrapController(commandMap:ICommandMap) {

        // Launch application;

        commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, InitModelCommand, ContextEvent);

        commandMap.mapEvent(ReflexContextEvent.MODEL_INIT_COMPLETE, InitViewCommand, ReflexContextEvent);

        commandMap.mapEvent(ReflexContextEvent.VIEW_INIT_PROGRESS, InitViewProgressCommand, ReflexContextEvent);
        commandMap.mapEvent(ReflexContextEvent.VIEW_INIT_COMPLETE, InitViewCompleteCommand, ReflexContextEvent);

        // radio SocialMedia
        commandMap.mapEvent(SocialMediaButtonEvent.CLICK, RadioSocialMediaCommand, SocialMediaButtonEvent);

        // search
        commandMap.mapEvent(GalleryEvent.SEARCH, StartSearchCommand, GalleryEvent);
        commandMap.mapEvent(SocialMediaServiceEvent.NO_ACTIVE_SOCIAL_MEDIA, SearchWarningCommand, SocialMediaServiceEvent)
        commandMap.mapEvent(SocialMediaServiceEvent.SEARCH_PROGRESS, SearchProgressCommand, SocialMediaServiceEvent);
        commandMap.mapEvent(SocialMediaServiceEvent.SEARCH_COMPLETE, SearchCompleteCommand, SocialMediaServiceEvent);

        commandMap.mapEvent(SocialMediaServiceEvent.COMPLETE_LOAD, CompleteLoadCommand, SocialMediaServiceEvent);

        //
        commandMap.mapEvent(HeaderEvent.FOCUS, BlockCoolerControlsCommand, HeaderEvent);
        commandMap.mapEvent(HeaderEvent.FOCUS_OUT, UnblockCoolerControlsCommand, HeaderEvent);
        commandMap.mapEvent(GalleryEvent.SELECT, AddItemToStackCommand, GalleryEvent);

        commandMap.mapEvent(StackEvent.PREVIEW, ImagePreviewCommand, StackEvent);
        commandMap.mapEvent(StackEvent.CLOSE_PREVIEW, ClosePreviewCommand, StackEvent);
        commandMap.mapEvent(StackEvent.NEXT, NextSlideCommand, StackEvent);
        commandMap.mapEvent(StackEvent.PREVIOUS, PreviousSlideCommand, StackEvent);
    }
}
}
