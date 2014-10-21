/**
 * Created by root on 10/14/14.
 */
package sm {
import patterns.enumeration.UintEnumeration;

public class SocialMedia extends UintEnumeration {

    public static const INSTAGRAM:SocialMedia = 		new SocialMedia(0);
    public static const PINTEREST:SocialMedia = 		new SocialMedia(1);
    public static const TUMBLR:SocialMedia = 		    new SocialMedia(2);
    public static const BEHANCE:SocialMedia = 		    new SocialMedia(3);
    public static const SM_500_PX:SocialMedia =         new SocialMedia(4);
    public static const FLICKR:SocialMedia =            new SocialMedia(5);
    public static const TWITTER:SocialMedia =           new SocialMedia(6);
    public static const TEST:SocialMedia =              new SocialMedia(7);


    public function SocialMedia(value:uint)
    {
        super(value);
    }
}
}
