#if !lime_hybrid


import openfl.Assets;


#if (!macro && !display && !waxe)


@:access(openfl._legacy.Assets)


class ApplicationMain {
	
	
	private static var barA:flash.display.Sprite;
	private static var barB:flash.display.Sprite;
	private static var container:flash.display.Sprite;
	private static var forceHeight:Int;
	private static var forceWidth:Int;
	
	#if hxtelemetry
	public static var telemetryConfig:hxtelemetry.HxTelemetry.Config;
	#end
	
	
	public static function main () {
		
		flash.Lib.setPackage ("Floating Point", "Super Probe Quest", "com.example.myapp", "0.0.1");
		
		
		#if ios
		flash.display.Stage.shouldRotateInterface = function (orientation:Int):Bool {
			return (orientation == flash.display.Stage.OrientationLandscapeLeft || orientation == flash.display.Stage.OrientationLandscapeRight);
			
		}
		#end
		
		#if hxtelemetry
		telemetryConfig = new hxtelemetry.HxTelemetry.Config ();
		telemetryConfig.allocations = true;
		telemetryConfig.host = "localhost";
		telemetryConfig.app_name = "Super Probe Quest";
		#end
		
		
		
		#if tizen
		flash.display.Stage.setFixedOrientation (flash.display.Stage.OrientationLandscapeRight);
		#end
		
		flash.Lib.create (function () {
				
				flash.Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
				flash.Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
				flash.Lib.current.loaderInfo = flash.display.LoaderInfo.create (null);
				
				#if mobile
				
				forceWidth = 640;
				forceHeight = 480;
				
				container = new flash.display.Sprite ();
				barA = new flash.display.Sprite ();
				barB = new flash.display.Sprite ();
				
				flash.Lib.current.stage.addChild (container);
				container.addChild (flash.Lib.current);
				container.addChild (barA);
				container.addChild (barB);
				
				applyScale ();
				flash.Lib.current.stage.addEventListener (flash.events.Event.RESIZE, applyScale);
				
				#end
				
				#if windows
				try {
					
					var currentPath = haxe.io.Path.directory (Sys.executablePath ());
					Sys.setCwd (currentPath);
					
				} catch (e:Dynamic) {}
				#elseif linux
				try {
					
					if (!sys.FileSystem.exists (Sys.getCwd () + "/lime-legacy.ndll")) {
						
						Sys.setCwd (haxe.io.Path.directory (Sys.executablePath ()));
						
					}
					
				} catch (e:Dynamic) {}
				#end
				
				
				
				openfl.Assets.initialize ();
				
				var hasMain = false;
				
				for (methodName in Type.getClassFields (Main)) {
					
					if (methodName == "main") {
						
						hasMain = true;
						break;
						
					}
					
				}
				
				if (hasMain) {
					
					Reflect.callMethod (Main, Reflect.field (Main, "main"), []);
					
				} else {
					
					var instance:DocumentClass = Type.createInstance (DocumentClass, []);
					
					if (Std.is (instance, flash.display.DisplayObject)) {
						
						flash.Lib.current.addChild (cast instance);
						
					}
					
				}
				
			},
			640, 480, 
			60, 
			0,
			(true ? flash.Lib.HARDWARE : 0) |
			(true ? flash.Lib.ALLOW_SHADERS : 0) |
			(false ? flash.Lib.REQUIRE_SHADERS : 0) |
			(false ? flash.Lib.DEPTH_BUFFER : 0) |
			(false ? flash.Lib.STENCIL_BUFFER : 0) |
			(true ? flash.Lib.RESIZABLE : 0) |
			(false ? flash.Lib.BORDERLESS : 0) |
			(true ? flash.Lib.VSYNC : 0) |
			(false ? flash.Lib.FULLSCREEN : 0) |
			(0 == 4 ? flash.Lib.HW_AA_HIRES : 0) |
			(0 == 2 ? flash.Lib.HW_AA : 0),
			"Super Probe Quest",
			null
			#if mobile, ScaledStage #end
		);
		
	}
	
	#if mobile
	public static function applyScale (?_) {
		var scaledStage:ScaledStage = cast flash.Lib.current.stage;
		
		var xScale:Float = scaledStage.__stageWidth / forceWidth;
		var yScale:Float = scaledStage.__stageHeight / forceHeight;
		
		if (xScale < yScale) {
			
			flash.Lib.current.scaleX = xScale;
			flash.Lib.current.scaleY = xScale;
			flash.Lib.current.x = (scaledStage.__stageWidth - (forceWidth * xScale)) / 2;
			flash.Lib.current.y = (scaledStage.__stageHeight - (forceHeight * xScale)) / 2;
			
		} else {
			
			flash.Lib.current.scaleX = yScale;
			flash.Lib.current.scaleY = yScale;
			flash.Lib.current.x = (scaledStage.__stageWidth - (forceWidth * yScale)) / 2;
			flash.Lib.current.y = (scaledStage.__stageHeight - (forceHeight * yScale)) / 2;
			
		}
		
		if (flash.Lib.current.x > 0) {
			
			barA.graphics.clear ();
			barA.graphics.beginFill (0x000000);
			barA.graphics.drawRect (0, 0, flash.Lib.current.x, scaledStage.__stageHeight);
			
			barB.graphics.clear ();
			barB.graphics.beginFill (0x000000);
			var x = flash.Lib.current.x + (forceWidth * flash.Lib.current.scaleX);
			barB.graphics.drawRect (x, 0, scaledStage.__stageWidth - x, scaledStage.__stageHeight);
			
		} else {
			
			barA.graphics.clear ();
			barA.graphics.beginFill (0x000000);
			barA.graphics.drawRect (0, 0, scaledStage.__stageWidth, flash.Lib.current.y);
			
			barB.graphics.clear ();
			barB.graphics.beginFill (0x000000);
			var y = flash.Lib.current.y + (forceHeight * flash.Lib.current.scaleY);
			barB.graphics.drawRect (0, y, scaledStage.__stageWidth, scaledStage.__stageHeight - y);
			
		}
		
	}
	#end
	
	
	#if neko
	@:noCompletion @:dox(hide) public static function __init__ () {
		
		untyped $loader.path = $array (haxe.io.Path.directory (Sys.executablePath ()), $loader.path);
		untyped $loader.path = $array ("./", $loader.path);
		untyped $loader.path = $array ("@executable_path/", $loader.path);
		
	}
	#end
	
	
}


@:build(DocumentClass.build())
@:keep class DocumentClass extends Main {}


#if mobile
class ScaledStage extends flash.display.Stage {
	
	
	public var __stageHeight (get, null):Int;
	public var __stageWidth (get, null):Int;
	
	
	public function new (inHandle:Dynamic, inWidth:Int, inHeight:Int) {
		
		super (inHandle, 0, 0);
		
	}
	
	
	private function get___stageHeight ():Int {
		
		return super.get_stageHeight ();
		
	}
	
	
	private function get___stageWidth():Int {
		
		return super.get_stageWidth ();
		
	}
	
	
	private override function get_stageHeight ():Int {
		
		return 480;
	
	}
	
	private override function get_stageWidth ():Int {
		
		return 640;
	
	}
	
	
}
#end


#elseif macro


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length >= 2 && (searchTypes.pack[1] == "display" || searchTypes.pack[2] == "display") && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				var method = macro { return flash.Lib.current.stage; }
				
				fields.push ({ name: "get_stage", access: [ APrivate, AOverride ], kind: FFun({ args: [], expr: method, params: [], ret: macro :flash.display.Stage }), pos: Context.currentPos () });
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#elseif waxe


class ApplicationMain {
	
	
	public static var autoShowFrame:Bool = true;
	public static var frame:wx.Frame;
	#if openfl
	static public var nmeStage:wx.NMEStage;
	#end
	
	
	public static function main () {
		
		#if openfl
		flash.Lib.setPackage ("Floating Point", "Super Probe Quest", "com.example.myapp", "0.0.1");
		
		#end
		
		wx.App.boot (function () {
			
			
			frame = wx.Frame.create (null, null, "Super Probe Quest", null, { width: 640, height: 480 });
			
			
			#if openfl
			var stage = wx.NMEStage.create (frame, null, null, { width: 640, height: 480 });
			#end
			
			var hasMain = false;
			for (methodName in Type.getClassFields (Main)) {
				if (methodName == "main") {
					hasMain = true;
					break;
				}
			}
			
			if (hasMain) {
				Reflect.callMethod (Main, Reflect.field (Main, "main"), []);
			}else {
				var instance = Type.createInstance (Main, []);
			}
			
			if (autoShowFrame) {
				wx.App.setTopWindow (frame);
				frame.shown = true;
			}
			
		});
		
	}
	
	#if neko
	@:noCompletion @:dox(hide) public static function __init__ () {
		
		untyped $loader.path = $array (haxe.io.Path.directory (Sys.executablePath ()), $loader.path);
		untyped $loader.path = $array ("./", $loader.path);
		untyped $loader.path = $array ("@executable_path/", $loader.path);
		
	}
	#end
	
	
}


#else


import Main;

class ApplicationMain {
	
	
	public static function main () {
		
		
		
	}
	
	
}


#end


#else


#if !macro


@:access(lime.app.Application)
@:access(lime.Assets)


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:openfl.display.Preloader;
	
	
	public static function create ():Void {
		
		var app = new lime.app.Application ();
		app.create (config);
		openfl.Lib.application = app;
		
		#if !flash
		var stage = new openfl._legacy.display.HybridStage (app.window.width, app.window.height, app.window.config.background);
		stage.addChild (openfl.Lib.current);
		app.addModule (stage);
		#end
		
		var display = new flixel.system.FlxPreloader ();
		
		preloader = new openfl.display.Preloader (display);
		app.setPreloader (preloader);
		preloader.onComplete.add (init);
		preloader.create (config);
		
		#if (js && html5)
		var urls = [];
		var types = [];
		
		
		urls.push ("assets/data/alicemap.oep");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/maze.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/plats.oel");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/rtgmap.oep");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("Orator Std Medium");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("assets/images/about/stemlogo.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/about/stemlogo.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/about/title_about.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/alice_hit.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/b-bottom.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/b-full.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/b-hori.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/b-island.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/b-lb.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/b-left.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/b-map.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/b-rb.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/b-right.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/b-top.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/b-ul.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/b-ur.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/b-vert.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/cleaner.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/dialogue/alice_dialogue_back.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/alicemaze/dialogue/alice_dialogue_back.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/dialogue/OldManNormal.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/dialogue/speak0.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/dialogue/speak_0.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/dialogue/speak_template.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/dialogue/tag.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/dialogue/wasd/wasd_a.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/dialogue/wasd/wasd_d.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/dialogue/wasd/wasd_finger.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/alicemaze/dialogue/wasd/wasd_s.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/alicemaze/dialogue/wasd/wasd_s.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/dialogue/wasd/wasd_template.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/alicemaze/dialogue/wasd/wasd_w.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/dialogue/wasd.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/alicemaze/player.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/bt_orig/comp_alice_alt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/bt_orig/comp_alice_hover.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/bt_orig/comp_lorri_alt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/bt_orig/comp_lorri_hover.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/bt_orig/comp_pepssi_alt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/bt_orig/comp_pepssi_hover.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/bt_orig/comp_ralph_alt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/bt_orig/comp_ralph_hover.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/buttonsprites/comp_alice_alt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/buttonsprites/comp_alice_d.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/buttonsprites/comp_heat_alt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/buttonsprites/comp_heat_d.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/buttonsprites/comp_lorri_alt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/buttonsprites/comp_lorri_d.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/buttonsprites/comp_pepssi_alt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/buttonsprites/comp_pepssi_d.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/buttonsprites/comp_ralph_alt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/buttonsprites/comp_ralph_d.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/buttonsprites/comp_rex_alt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/buttonsprites/comp_rex_d.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/buttonsprites/comp_rtg_alt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/buttonsprites/comp_rtg_d.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/buttonsprites/comp_swap_alt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/buttonsprites/comp_swap_d.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/buttonsprites/template.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/component/comp_alice.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/comp_heatshield.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/comp_lorri.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/comp_pepssi.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/comp_ralph.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/comp_rex.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/comp_rtg.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/comp_swap.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/NH.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/component/nh_large.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/facts/earth-32x.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/facts/fact0.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/facts/fact1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/facts/fact2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/facts/fact3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/facts/facthide.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/found/alicefound.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/found/alicefound.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/found/alice_button_backdrop.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/found/found-template.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/found/found_alice.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/found/found_alice_button.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/found/found_alice_button.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/found/found_pepssi.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/found/found_pepssi_button.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/found/rtg_found.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/hub/alice_info.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/hub/blockout.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/hub/components_hero.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/hub/heat_info.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/hub/lorri_info.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/hub/pepssi_info.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/hub/ralph_info.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/hub/rex_info.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/hub/rtg_info.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/hub/swap_info.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/icon.ico");
		types.push (lime.Assets.AssetType.BINARY);
		
		
		urls.push ("assets/images/intro/beach.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/intro/name.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/intro/original/beach.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/intro/original/Untitled.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/intro/original/vab.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/intro/plane.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/intro/text0.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/intro/text1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/intro/text2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/intro/text3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/intro/tower.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/intro/vab.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/launchblock/cloud0.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/launchblock/cloud1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/launchblock/launch-thin-window.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/launchblock/launch-thin-window.png.meta");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/launchblock/nh-atlas-v.pdn.meta");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/launchblock/nh-launch-block.pdn.meta");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/launchblock/nh-launch-block.png.meta");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/launchblock/nh-launch-long - Copy.pdn.meta");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/launchblock/nh-launch-long-old.pdn.meta");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/launchblock/nh-launch-long.pdn.meta");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/launchblock/nh-launch-long.png.meta");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/launchblock/nh-pastel.png.meta");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/launchblock/nh-postcard - Copy - Copy.png.meta");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/launchblock/nh-postcard - Copy.pdn.meta");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/launchblock/nh-postcard - Copy.png.meta");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/launchblock/nh-postcard-skeu.png.meta");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/launchblock/nh-postcard.pdn.meta");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/launchblock/nh-postcard.png.meta");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/launchblock/other/nh-atlas-v.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/launchblock/other/nh-launch-block/Atlas_V_551_with_New_Horizons_on_Launch_Pad_41.jpg");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/launchblock/other/nh-launch-block/nh-static-atlasv-launch.jpg");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/launchblock/other/nh-launch-block.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/launchblock/other/nh-launch-block.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/launchblock/other/nh-launch-long - Copy.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/launchblock/other/nh-launch-long-old.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/launchblock/other/nh-launch-long.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/launchblock/other/nh-launch-long.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/launchblock/other/nh-pastel.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/launchblock/other/nh-postcard - Copy.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/launchblock/other/nh-postcard - Copy.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/launchblock/other/nh-postcard.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/launchblock/other/nh-postcard.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/launchblock/other/pad-norocket.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/launchblock/other/pad-rocket.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/launchblock/pad-norocket.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/launchblock/pad-rocket.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/launchblock/skyback - Copy.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/launchblock/skyback.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/logo.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/logoflicker.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/button originals/buttontemplate - Copy.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/menu/button originals/button_begin.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/menu/button originals/button_mute.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/menu/button originals/button_pad.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/menu/button originals/button_quit.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/menu/button originals/button_settings.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/menu/button originals/d_warning.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/menu/buttontemplate.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/menu/button_about.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/button_back.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/button_begin.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/button_debug.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/button_f.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/button_facts.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/button_full.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/button_pad.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/button_pluto.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/button_quit.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/button_rand.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/button_setting.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/button_settings.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/coordsblock.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/d_warning.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/d_warn_cancel.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/d_warn_ok.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/menu/d_warn_ok.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/full_exit_notice.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/moons/CharonOrbit.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/moons/HydraOrbit.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/moons/KerberosOrbit.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/moons/NixOrbit.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/moons/original/Charon.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/moons/original/Hydra.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/moons/original/Kerberos.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/moons/original/Nix.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/moons/original/Styx.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/moons/Pluto.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/moons/StyxOrbit.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/splash/splash_x640.jpg");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/splash/startup-splash-hero - Copy.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/splash/startup-splash-hero.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/splash_x640.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/starback.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/tutorial.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/misc/320xp.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/misc/320xp.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/misc/pls.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/mute/Mute.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/mute/MuteOn.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pepssiwire/background.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pepssiwire/bblue.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pepssiwire/box - Copy.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/pepssiwire/box-mockup.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/pepssiwire/box-mockup.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pepssiwire/box.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/pepssiwire/box.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pepssiwire/bparcel.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pepssiwire/bpeach.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pepssiwire/bpink.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pepssiwire/colors.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pepssiwire/dialogback.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pepssiwire/dialogtext.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pepssiwire/old/0bluealt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pepssiwire/old/0limealt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pepssiwire/old/0peachalt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pepssiwire/old/0pinkalt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pepssiwire/old/1bluealt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pepssiwire/old/1limealt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pepssiwire/old/1peachalt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pepssiwire/old/1pinkalt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pepssiwire/original/0blue.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pepssiwire/original/0lime.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pepssiwire/original/0peach.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pepssiwire/original/0pink.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pepssiwire/parcel.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/pepssiwire/parcel.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/pepssiwire/sgsgsg.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/pepssiwire/Untitled.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/pepssiwire/Untitled.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/reference.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/rtgrun/background.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/rtgrun/background.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/rtgrun/clouds.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/rtgrun/mockup.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/rtgrun/placeholder.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/rtgrun/placeholder.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/rtgrun/sky.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/settings/button_fullscreen.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/settings/button_fullscreen_alt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/settings/button_sound.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/settings/button_sound_alt.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/settings/originals/button_fullscreen.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/settings/originals/button_sound.pdn");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/settings/title_settings.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/music/menu-main2.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/music/music_credits.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/sounds/data.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/error.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/get.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/introtone.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/introtone.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/Pickup_Coin.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/select.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/signal.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("Nokia Cellphone FC Small");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("Arial");
		types.push (lime.Assets.AssetType.FONT);
		
		
		
		if (config.assetsPrefix != null) {
			
			for (i in 0...urls.length) {
				
				if (types[i] != lime.Assets.AssetType.FONT) {
					
					urls[i] = config.assetsPrefix + urls[i];
					
				}
				
			}
			
		}
		
		preloader.load (urls, types);
		#end
		
		var result = app.exec ();
		
		#if (sys && !nodejs && !emscripten)
		Sys.exit (result);
		#end
		
	}
	
	
	public static function init ():Void {
		
		var loaded = 0;
		var total = 0;
		var library_onLoad = function (__) {
			
			loaded++;
			
			if (loaded == total) {
				
				start ();
				
			}
			
		}
		
		preloader = null;
		
		
		
		if (total == 0) {
			
			start ();
			
		}
		
	}
	
	
	public static function main () {
		
		config = {
			
			build: "1161",
			company: "Floating Point",
			file: "Super Probe Quest",
			fps: 60,
			name: "Super Probe Quest",
			orientation: "landscape",
			packageName: "com.example.myapp",
			version: "0.0.1",
			windows: [
				
				{
					antialiasing: 0,
					background: 0,
					borderless: false,
					depthBuffer: false,
					display: 0,
					fullscreen: false,
					hardware: true,
					height: 480,
					parameters: "{}",
					resizable: true,
					stencilBuffer: false,
					title: "Super Probe Quest",
					vsync: true,
					width: 640,
					x: null,
					y: null
				},
			]
			
		};
		
		#if (js && html5)
		#if (munit || utest)
		openfl.Lib.embed (null, 640, 480, "null");
		#end
		#else
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		var hasMain = false;
		var entryPoint = Type.resolveClass ("Main");
		
		for (methodName in Type.getClassFields (entryPoint)) {
			
			if (methodName == "main") {
				
				hasMain = true;
				break;
				
			}
			
		}
		
		lime.Assets.initialize ();
		
		if (hasMain) {
			
			Reflect.callMethod (entryPoint, Reflect.field (entryPoint, "main"), []);
			
		} else {
			
			var instance:DocumentClass = Type.createInstance (DocumentClass, []);
			
			if (Std.is (instance, flash.display.DisplayObject)) {
				
				flash.Lib.current.addChild (cast instance);
				
			}
			
		}
		
		openfl.Lib.current.stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		
	}
	
	
	#if neko
	@:noCompletion @:dox(hide) public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


@:build(DocumentClass.build())
@:keep class DocumentClass extends Main {}


#else


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length >= 2 && (searchTypes.pack[1] == "display" || searchTypes.pack[2] == "display") && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				var method = macro { return flash.Lib.current.stage; }
				
				fields.push ({ name: "get_stage", access: [ APrivate, AOverride ], kind: FFun({ args: [], expr: method, params: [], ret: macro :flash.display.Stage }), pos: Context.currentPos () });
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#end


#end
