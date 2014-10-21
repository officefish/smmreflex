/**
 * Created by root on 10/14/14.
 */
package sm {
import flash.display.Bitmap;
import flash.display.Sprite;

public class SocialMediaFactory {

    [Embed(source ="../../out/production/smm_reflex/assets/sm_icons/behance.jpg")] private static var BehanceAsset:Class;
    [Embed(source = "../../out/production/smm_reflex/assets/sm_icons/pinterest.jpg")] private static var PinterestAsset:Class;
    [Embed(source = "../../out/production/smm_reflex/assets/sm_icons/tumblr.jpg")] private static var TumblrAsset:Class;
    [Embed(source = "../../out/production/smm_reflex/assets/sm_icons/instagram.jpg")] private static var InstagramAsset:Class;

    [Embed(source = "../../out/production/smm_reflex/assets/sm_icons/twitter.jpg")] private static var TwitterAsset:Class;
    [Embed(source ="../../out/production/smm_reflex/assets/sm_icons/flickr.jpg")] private static var FlickrAsset:Class;
    [Embed(source = "../../out/production/smm_reflex/assets/sm_icons/500px.jpg")] private static var Asset500px:Class;
    [Embed(source = "../../out/production/smm_reflex/assets/sm_icons/test.jpg")] private static var TestAsset:Class;



    public static function getIconAsset (socialMedia:SocialMedia) :Bitmap {
        var assetClass:Class;
        switch (socialMedia) {
            case SocialMedia.INSTAGRAM: {
                assetClass = InstagramAsset;
                break;
            }
            case SocialMedia.PINTEREST: {
                assetClass = PinterestAsset;
                break;
            }
            case SocialMedia.TUMBLR: {
                assetClass = TumblrAsset;
                break;
            }
            case SocialMedia.BEHANCE: {
                assetClass = BehanceAsset;
                break;
            }
            case SocialMedia.SM_500_PX: {
                assetClass = Asset500px;
                break;
            }
            case SocialMedia.FLICKR: {
                assetClass = FlickrAsset;
                break;
            }
            case SocialMedia.TWITTER: {
                assetClass = TwitterAsset;
                break;
            }
            case SocialMedia.TEST: {
                assetClass = TestAsset;
                break;
            }

        }

        if (!assetClass) return null;

        var bitmap:Bitmap = new assetClass as Bitmap;
        return bitmap;
    }

    public static function newSocialMediaButton (socialMedia:SocialMedia, size:uint) :SocialMediaButton {
        var asset:Bitmap = getIconAsset(socialMedia);
        if (!asset) return null;

        var icon:SocialMediaButton = new SocialMediaButton(socialMedia, asset, size);
        return icon;
    }
}
}
