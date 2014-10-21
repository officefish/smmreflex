/**
 * Created by root on 10/14/14.
 */
package reflex_mvc.view {
import flare.basic.Scene3D;
import flare.basic.Viewer3D;
import flare.core.Camera3D;
import flare.core.Mesh3D;
import flare.core.Pivot3D;
import flare.core.Texture3D;
import flare.loaders.ColladaLoader;
import flare.materials.Shader3D;
import flare.materials.filters.ColorFilter;
import flare.materials.filters.TextureMapFilter;
import flare.physics.ContactData;
import flare.physics.Contact;
import flare.physics.colliders.BoxCollider;
import flare.physics.colliders.Collider;
import flare.physics.colliders.MeshCollider;
import flare.physics.colliders.RayCollider;
import flare.physics.core.PhysicsPlane;
import flare.physics.core.PhysicsSystemManager;
import flare.physics.core.RigidBody;
import flare.physics.vehicles.PhysicsVehicle;

import flare.primitives.Box;
import flare.primitives.Cube;
import flare.primitives.Sphere;
import flare.system.Input3D;
import flare.utils.Pivot3DUtils;

import flash.display.BitmapData;

import flash.display.DisplayObjectContainer;

import flash.display.Sprite;
import flash.events.Event;

import flare.physics.core.PhysicsBox

import flash.geom.Vector3D;

import flash.text.AntiAliasType;

import flash.text.TextField;
import flash.text.TextFormat;

import flashx.textLayout.formats.TextAlign;

import reflex_mvc.errors.HandyError;
import reflex_mvc.events.GalleryEvent;
import reflex_mvc.events.HandlyEvent;
import reflex_mvc.model.photo.ShortPhotoData;


public class GalleryCooler extends Handly implements IGalleryCooler {

    private var scene:Scene3D;
    private var elevator:Pivot3D;

    private var lift:Pivot3D;

    private var smmTexture:Texture3D;

    private var longShot:uint = 0;

    private var physicsCube:Pivot3D;

    private var frontFlag:Boolean = false;
    private var liftAsset:Pivot3D;

    private var activeCube:PhotoCube;

    private var acceptCubeLabel:TextField;
    private var acceptCubeFormat:TextFormat;

    private var dropCubeLabel:TextField;


    private var acceptFlag:Boolean = false;

    private var sensor:Cube;

    private var controlFlag:Boolean = true;

    private var rightWeel:Pivot3D;
    private var leftWeel:Pivot3D;
    private var frontWeels:Pivot3D;



    override public function toStringConfigArgs () :String {
        return '(contextView:DisplayObjectContainer)';
    }

    override public function configure (...args) :IHandy {
        var contextView:DisplayObjectContainer = args[0];
        if (!contextView) {
            throw new HandyError(HandyError.NO_DO_CONTAINER);
        }


        acceptCubeFormat = new TextFormat();
        acceptCubeFormat.color = 0xFFFFFF;
        acceptCubeFormat.align = TextAlign.CENTER;
        acceptCubeFormat.size = 14;
        acceptCubeFormat.bold = true;
        acceptCubeFormat.font = 'Helvetica';

        acceptCubeLabel = new TextField();
        acceptCubeLabel.antiAliasType = AntiAliasType.ADVANCED;
        acceptCubeLabel.defaultTextFormat = acceptCubeFormat;
        acceptCubeLabel.mouseEnabled = false;
        acceptCubeLabel.text = "Press 'F' or 'LEFT' to accept Cube!";
        acceptCubeLabel.y = 120;

        dropCubeLabel = new TextField();
        dropCubeLabel.antiAliasType = AntiAliasType.ADVANCED;
        dropCubeLabel.defaultTextFormat = acceptCubeFormat;
        dropCubeLabel.mouseEnabled = false;
        dropCubeLabel.text = "Press 'G' or 'RIGHT' to drop Cube!";
        dropCubeLabel.y = 120;

        acceptCubeLabel.width = dropCubeLabel.width = 1000;

        scene = new Viewer3D( contextView, "", 0.2 );

        scene.addEventListener(Scene3D.COMPLETE_EVENT, completeEvent)
        scene.addEventListener( Scene3D.POSTRENDER_EVENT, postRenderEvent );
        scene.showLogo = false;

        var floor:Cube = new Cube( "floor", 2000, 2, 2000 );
        floor.collider = new BoxCollider( 2000, 2, 2000 );
        floor.collider.isStatic = true;
        scene.addChild( floor );

        sensor = new Cube( "sensor", 4000, 1, 4000 );
        sensor.collider = new BoxCollider( 4000, 1, 4000 );
        sensor.collider.isStatic = true;
        sensor.collider.collectContacts = true;
        sensor.translateY(-700);
        sensor.visible = false;
        scene.addChild( sensor );




        return this;

    }

    private function postRenderEvent(e:Event):void
    {

    }

    public function getScene () :Scene3D {
        return scene;
    }

    override public function startup () :IHandy {
        if (!scene) {
            throw  new HandyError(HandyError.NOT_CONFIGURE);
        }

        //dispatchEvent(new HandlyEvent(HandlyEvent.STARTUP_COMPLETE));
        scene.addChildFromFile('assets/lift.zf3d');

        smmTexture = scene.addTextureFromFile('assets/sm_icons/pinterest.jpg')
        return this;
    }

    override public function  shutdown () :IHandy {
        scene.removeEventListener( Scene3D.UPDATE_EVENT, updateEvent );
        return this;
    }

    override public function destroy () :IHandy {
        // some code There to prepare this Handy to GC.
        return this;
    }

    private function completeEvent (event:Event) :void {

        scene.addEventListener( Scene3D.UPDATE_EVENT, updateEvent );
        elevator = scene.getChildByName('ForkLift');
        liftAsset = scene.getChildByName('Lift');

        elevator.setRotation(0,0,0);
       // elevator.translateX(10);

        var shader:Shader3D = new Shader3D();
        shader.filters = [new ColorFilter(0xFDD017)];
        shader.build();
        elevator.setMaterial(shader);

        elevator.collider.collectContacts = true;

        //elevator.y = 10;

        lift = elevator.getChildByName('LiftPhysics');
        lift.addChild(liftAsset,true);

        var wheelsShader:Shader3D = new Shader3D();
        wheelsShader.filters = [new ColorFilter(0x222222)];
        wheelsShader.build();

        leftWeel = scene.getChildByName('weel1');
        rightWeel = scene.getChildByName('weel2');
        frontWeels = scene.getChildByName('frontWeels');

        leftWeel.setMaterial(wheelsShader);
        rightWeel.setMaterial(wheelsShader);
        frontWeels.setMaterial(wheelsShader);

   //

        scene.camera = new Camera3D( "myOwnCamera" );
        scene.camera.setPosition( 300, 600, 60 );
        scene.camera.lookAt( 0, 0, 0 );

       dispatchEvent(new HandlyEvent(HandlyEvent.STARTUP_COMPLETE))
    }
    private function updateEvent(e:Event):void
    {
        var liftCube:PhotoCube;
        var rotation:Vector3D;
        var position:Vector3D;
        scene.physics.step();



        if (elevator.collider.numContacts > 0) {

            acceptFlag = false;
            if (stage.contains(acceptCubeLabel)) {
                stage.removeChild(acceptCubeLabel);
            }

            if (stage.contains(dropCubeLabel)) {
                stage.removeChild(dropCubeLabel);
            }

            while (elevator.collider.contactData.length) {
                var contact:ContactData =  elevator.collider.contactData.shift();
                var collider_0_Id:String = contact.info.collider0.pivot.name;
                var collider_1_Id:String = contact.info.collider1.pivot.name;

                if (collider_0_Id == 'LiftPhysics' && contact.info.collider1.pivot is PhotoCube) {
                    if (checkPhotoCubeHeight (contact.info.collider1.pivot)) {
                        acceptFlag = true;
                        liftCube = contact.info.collider1.pivot as PhotoCube;
                        this.stage.addChild(acceptCubeLabel);
                        break;
                    }
                }

                if (collider_1_Id == 'LiftPhysics' && contact.info.collider0.pivot is PhotoCube) {
                    if (checkPhotoCubeHeight (contact.info.collider0.pivot)) {
                        acceptFlag = true;
                        liftCube = contact.info.collider0.pivot as PhotoCube;
                        this.stage.addChild(acceptCubeLabel);
                        break;
                    }
                }
            }

            if (activeCube) {
                stage.addChild(dropCubeLabel);
            }
        }

        if (sensor.collider.numContacts > 0) {
            while (sensor.collider.contactData.length) {
                var contact:ContactData = sensor.collider.contactData.shift();
                var collider_0_Id:String = contact.info.collider0.pivot.name;
                var collider_1_Id:String = contact.info.collider1.pivot.name;

                if (collider_0_Id == 'sensor' && contact.info.collider1.pivot is PhotoCube) {
                    var deletedCube:PhotoCube = contact.info.collider1.pivot as PhotoCube;
                    deletedCube.collider = null;
                    var event:GalleryEvent = new GalleryEvent(GalleryEvent.SELECT);
                    event.shortPhotoData = deletedCube.getData();
                    scene.removeChild(deletedCube);
                    dispatchEvent(event);
                    break;


                }

                if (collider_1_Id == 'sensor' && contact.info.collider0.pivot is PhotoCube) {
                    var deletedCube:PhotoCube = contact.info.collider0.pivot as PhotoCube;
                    deletedCube.collider = null;
                    var event:GalleryEvent = new GalleryEvent(GalleryEvent.SELECT);
                    event.shortPhotoData = deletedCube.getData();
                    scene.removeChild(deletedCube);
                    dispatchEvent(event);
                    break;
                }

                if (collider_0_Id == 'sensor' && collider_1_Id == 'LiftPhysics') {
                   elevator.setPosition(0,0,0);
                   elevator.setRotation(0,0,0);
                   elevator.collider.isRigidBody = false;
                   elevator.collider.sleep();
                   elevator.collider.awake();

                }

                if (collider_1_Id == 'sensor' && collider_0_Id == 'LiftPhysics') {
                    elevator.setPosition(0,0,0);
                    elevator.setRotation(0,0,0);
                    elevator.collider.isRigidBody = false;
                    elevator.collider.sleep();
                    elevator.collider.awake();
                }
            }
        }



        if (controlFlag) {

            if (Input3D.keyDown(Input3D.LEFT) || Input3D.keyDown(Input3D.F)) {
                if (!activeCube && acceptFlag && liftCube) {

                    activeCube = liftCube;
                    activeCube.collider = null;
                    lift.addChild(activeCube, true);

                }
            }

            if (Input3D.keyDown(Input3D.RIGHT) || Input3D.keyDown(Input3D.G)) {
                if (activeCube) {
                    scene.addChild(activeCube, true);
                    activeCube.collider = new BoxCollider(activeCube.width,activeCube.height, activeCube.depth);
                    activeCube.collider.isRigidBody = true;
                    activeCube.collider.collectContacts;
                    activeCube.collider.mass = 20;
                    activeCube.setScale(1,1,1);
                    activeCube.setRotation(0, 0, 0);
                    activeCube = null;
                }
            }

            if ( Input3D.keyDown( Input3D.W ) ) {
                elevator.collider.isRigidBody = true;
                elevator.translateY(-1);
                frontWeels.rotateX(4);
                leftWeel.rotateX(8);
                rightWeel.rotateX(8);
            }
            if ( Input3D.keyDown( Input3D.S ) ) {
                elevator.collider.isRigidBody = true;

                elevator.translateY(1);
                frontWeels.rotateX(-4);
                leftWeel.rotateX(-8);
                rightWeel.rotateX(-8);
            }
            if ( Input3D.keyDown( Input3D.A ) ) {

                elevator.collider.isRigidBody = true;
                elevator.rotateZ(-4);
                leftWeel.setRotation(-1, -8, -30);
                rightWeel.setRotation(-1, -8, -30);
             }
            if ( Input3D.keyUp(Input3D.A ) ) {

                elevator.collider.isRigidBody = true;
                leftWeel.setRotation(-1, 0, 0);
                rightWeel.setRotation(-1, 0, 0);
            }
            if ( Input3D.keyDown( Input3D.D ) ) {
                elevator.rotateZ(4);
                leftWeel.setRotation(-1, 8, 30);
                rightWeel.setRotation(-1, 8, 30);
            }
            if ( Input3D.keyUp( Input3D.D ) ) {
                elevator.collider.isRigidBody = true;

                leftWeel.setRotation(-1, 0, 0);
                rightWeel.setRotation(-1, 0, 0);
            }
            if ( Input3D.keyDown(Input3D.UP) || Input3D.keyDown(Input3D.Z) ) {
                elevator.collider.isRigidBody = true;

                if (lift.getPosition().z < 3) {
                   lift.translateZ(50);
                 //   liftAsset.setPosition(position.x, position.y, position.z);
               }
            }
            if ( Input3D.keyDown( Input3D.DOWN ) ||  Input3D.keyDown(Input3D.X) ) {
                elevator.collider.isRigidBody = true;

                if (lift.getPosition().z > -2.8) {
                    lift.translateZ(-50);
               }
            }
        }

   }

    private function degreesToRadians(degrees:Number):Number {
        return degrees * Math.PI / 180;
    }

    private function getAngle (xCof:Number, yCof:Number) :int {
        if (xCof > 2 && xCof > -2) {
            if (yCof > 0) {
                return 180 - yCof;
            } else {
                return 180 - yCof;
            }
        } else {
            if (yCof > 0) {
                return yCof;
            } else {
                return 360 + yCof;
            }
        }
    }

    private function checkPhotoCubeHeight (pivot:Pivot3D) :Boolean {
        if (pivot.y > 5.5) {
            return true;
        }
        return false;
    }

    public function placeAssets (assets:Vector.<ShortPhotoData>) :void {
        var asset:ShortPhotoData;
        var cube:PhotoCube;

        for (var i:int = 0; i < assets.length; i ++) {
            asset = assets[i];
            cube = new PhotoCube(asset.id , asset.rawContent, Math.round(asset.rawContent.width / 10),Math.round(asset.rawContent.height / 10), Math.round(asset.rawContent.height / 10), 1);
            cube.setData(asset);
            scene.addChild(cube);
        }
    }

    public function blockControls () :void {
        controlFlag = false;
    }
    public function unblockControls () :void {
        controlFlag = true;
    }


}
}
