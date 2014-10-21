/**
 * Created by root on 10/15/14.
 */
package reflex_mvc.controller.bootstrap.commands.search {
import org.robotlegs.mvcs.Command;

import reflex_mvc.events.GalleryEvent;
import reflex_mvc.events.SocialMediaServiceEvent;
import reflex_mvc.events.SocialMediaServiceEvent;
import reflex_mvc.model.ReflexContextModel;
import reflex_mvc.model.SearchModel;
import reflex_mvc.service.BehanceService;
import reflex_mvc.service.FlickrService;
import reflex_mvc.service.ISocialMediaService;
import reflex_mvc.service.InstagramService;
import reflex_mvc.service.PinterestService;
import reflex_mvc.service.SM_500pxService;

import reflex_mvc.service.SM_500pxService;
import reflex_mvc.service.SocialMediaService;
import reflex_mvc.service.TestService;
import reflex_mvc.service.TumblrService;
import reflex_mvc.service.TwitterService;

import sm.SocialMedia;

public class StartSearchCommand extends Command {


    [Inject]
    public var event:GalleryEvent;

    [Inject (name='contextModel')]
    public var model:ReflexContextModel;

    [Inject (name='searchModel')]
    public var searchModel:SearchModel;


    [Inject]
    public var instagramService:InstagramService;

    [Inject]
    public var pinterestService:PinterestService;

    [Inject]
    public var tumblrService:TumblrService;

    [Inject]
    public var behanceService:BehanceService;

    [Inject]
    public var sm500pxService:SM_500pxService;

    [Inject]
    public var flickrService:FlickrService;

    [Inject]
    public var twitterService:TwitterService;

    [Inject]
    public var testService:TestService;


    override public function execute():void {

      var activeSocialMedia:Vector.<SocialMedia> = model.getActiveSocialMedia();
      if (!activeSocialMedia.length) {

          var warning:String = 'No Active Social Media!';
          var suggestion:String = 'Activate some social media to start searching.';
          var confirmFlag:Boolean = true;
          var cancelFlag:Boolean = false;

          dispatch(new SocialMediaServiceEvent(SocialMediaServiceEvent.NO_ACTIVE_SOCIAL_MEDIA,
                  {
                      'warning':warning,
                      'suggestion':suggestion,
                      'confirm':confirmFlag,
                      'cancel':cancelFlag

                  }));
          return;
      };

      searchModel.tag = event.tag;
      searchModel.loop = getSearchLoopServices (activeSocialMedia);

      var service:ISocialMediaService = searchModel.loop.shift();
      service.searchPhoto(searchModel.tag);
    }


    private function getSearchLoopServices (socialMediaVector:Vector.<SocialMedia>) :Vector.<ISocialMediaService> {
        var vector:Vector.<ISocialMediaService> = new Vector.<ISocialMediaService>();
        var services:Vector.<ISocialMediaService> = this.services;
        for (var i:int = 0; i < socialMediaVector.length; i ++) {
            vector.push(services[(socialMediaVector[i] as SocialMedia).value]);
        }
        return vector;
    }

    public function get services() :Vector.<ISocialMediaService> {
       return new <ISocialMediaService>
                    [
                        instagramService,
                        pinterestService,
                        tumblrService,
                        behanceService,
                        sm500pxService,
                        flickrService,
                        twitterService,
                        testService
                    ]

    }

}
}