/**
 * Created by root on 10/18/14.
 */
package reflex_mvc.view {
import flare.core.Texture3D;
import flare.materials.Material3D;
import flare.materials.Shader3D;
import flare.materials.filters.TextureMapFilter;
import flare.physics.colliders.BoxCollider;
import flare.primitives.Cube;

import flash.display.BitmapData;

import reflex_mvc.model.photo.ShortPhotoData;

public class PhotoCube extends Cube {

    private var _photoData:ShortPhotoData;

    public function PhotoCube(name:String, data:BitmapData,  width:Number, height:Number, depth:Number, segments:int = 10, material:Material3D = null) {

        super (name, width, height, depth, segments, material);

        this.collider = new BoxCollider(width,height, depth);
        this.collider.isRigidBody = true;
        this.collider.collectContacts;
        this.collider.mass = 40;
        this.setPosition( Math.round(Math.random() * 120),  Math.round(Math.random() * 30) + 360,  Math.round(Math.random() * 120) );
        this.rotateZ( Math.round(Math.random() * 90) );


        var texture:Texture3D = new Texture3D();
        texture.bitmapData = data;
        var _material:Shader3D = new Shader3D( "material_" + name);
        _material.filters = [ new TextureMapFilter(texture)];
        setMaterial( _material );
    }

    public function setData (data:ShortPhotoData) :void {
        _photoData = data;
    }

    public function getData () :ShortPhotoData {
        return _photoData;
    }


}
}
