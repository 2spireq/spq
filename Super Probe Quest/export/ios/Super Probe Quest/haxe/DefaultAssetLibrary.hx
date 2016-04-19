#if !lime_hybrid


package;


import haxe.Timer;
import haxe.Unserializer;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.MovieClip;
import openfl.events.Event;
import openfl.text.Font;
import openfl.media.Sound;
import openfl.net.URLRequest;
import openfl.utils.ByteArray;
import openfl.Assets;

#if neko
import neko.vm.Deque;
import neko.vm.Thread;
#elseif cpp
import cpp.vm.Deque;
import cpp.vm.Thread;
#end

#if sys
import sys.FileSystem;
#end

#if ios
import openfl._legacy.utils.SystemPath;
#end


@:access(openfl.media.Sound)
class DefaultAssetLibrary extends AssetLibrary {
	
	
	private static var loaded = 0;
	private static var loading = 0;
	private static var workerIncomingQueue = new Deque<Dynamic> ();
	private static var workerResult = new Deque<Dynamic> ();
	private static var workerThread:Thread;
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		
		
		
		Font.registerFont (__ASSET__assets_fonts_oratorstd_otf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		Font.registerFont (__ASSET__assets_fonts_nokiafc22_ttf);
		Font.registerFont (__ASSET__assets_fonts_arial_ttf);
		
		
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		useManifest = true;
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		
	}
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			if (type == BINARY || type == null || (assetType == BINARY && type == TEXT)) {
				
				return true;
				
			}
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), BitmapData);
			
		} else {
			
			return BitmapData.load (path.get (id));
			
		}
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), ByteArray);
			
		} else {
			
			return ByteArray.readFile (path.get (id));
			
		}
		
	}
	
	
	public override function getFont (id:String):Font {
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			Font.registerFont (fontClass);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return new Font (path.get (id));
			
		}
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), Sound);
			
		} else {
			
			return new Sound (new URLRequest (path.get (id)), null, true);
			
		}
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), Sound);
			
		} else {
			
			return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
			
		}
		
	}
	
	
	public override function getText (id:String):String {
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		return true;
		
	}
	
	
	public override function list (type:AssetType):Array<String> {
		
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (type == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		__load (getBitmapData, id, handler);
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		__load (getBytes, id, handler);
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		__load (getFont, id, handler);
		
	}
	
	
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								path.set (asset.id, asset.path);
								type.set (asset.id, Type.createEnum (AssetType, asset.type));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		__load (getMusic, id, handler);
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		__load (getSound, id, handler);
		
	}
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
	}
	
	
	private static function __doWork ():Void {
		
		while (true) {
			
			var message = workerIncomingQueue.pop (true);
			
			if (message == "WORK") {
				
				var getMethod = workerIncomingQueue.pop (true);
				var id = workerIncomingQueue.pop (true);
				var handler = workerIncomingQueue.pop (true);
				
				var data = getMethod (id);
				workerResult.add ("RESULT");
				workerResult.add (data);
				workerResult.add (handler);
				
			} else if (message == "EXIT") {
				
				break;
				
			}
			
		}
		
	}
	
	
	private inline function __load<T> (getMethod:String->T, id:String, handler:T->Void):Void {
		
		workerIncomingQueue.add ("WORK");
		workerIncomingQueue.add (getMethod);
		workerIncomingQueue.add (id);
		workerIncomingQueue.add (handler);
		
		loading++;
		
	}
	
	
	public static function __poll ():Void {
		
		if (loading > loaded) {
			
			if (workerThread == null) {
				
				workerThread = Thread.create (__doWork);
				
			}
			
			var message = workerResult.pop (false);
			
			while (message == "RESULT") {
				
				loaded++;
				
				var data = workerResult.pop (true);
				var handler = workerResult.pop (true);
				
				if (handler != null) {
					
					handler (data);
					
				}
				
				message = workerResult.pop (false);
				
			}
			
		} else {
			
			if (workerThread != null) {
				
				workerIncomingQueue.add ("EXIT");
				workerThread = null;
				
			}
			
		}
		
	}
	
	
}


#if (windows || mac || linux)


@:font("C:/HaxeToolkit/haxe/lib/flixel/3,3,12/assets/fonts/nokiafc22.ttf") @:keep #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends flash.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/3,3,12/assets/fonts/arial.ttf") @:keep #if display private #end class __ASSET__assets_fonts_arial_ttf extends flash.text.Font {}



@:keep class __ASSET__assets_fonts_oratorstd_otf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/OratorStd.otf"; fontName = "Orator Std Medium"; }}


#else


class __ASSET__assets_fonts_oratorstd_otf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/OratorStd.otf"; fontName = "Orator Std Medium";  }}
class __ASSET__assets_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/nokiafc22.ttf"; fontName = "Nokia Cellphone FC Small";  }}
class __ASSET__assets_fonts_arial_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/arial.ttf"; fontName = "Arial";  }}


#end


#else


package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if (js && html5)
import lime.net.URLLoader;
import lime.net.URLRequest;
#elseif flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_oratorstd_otf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_arial_ttf);
		
		
		#end
		
		#if flash
		
		path.set ("assets/data/alicemap.oep", "assets/data/alicemap.oep");
		type.set ("assets/data/alicemap.oep", AssetType.TEXT);
		path.set ("assets/data/maze.oel", "assets/data/maze.oel");
		type.set ("assets/data/maze.oel", AssetType.TEXT);
		path.set ("assets/fonts/OratorStd.otf", "assets/fonts/OratorStd.otf");
		type.set ("assets/fonts/OratorStd.otf", AssetType.FONT);
		path.set ("assets/images/alicemaze/alice_hit.png", "assets/images/alicemaze/alice_hit.png");
		type.set ("assets/images/alicemaze/alice_hit.png", AssetType.IMAGE);
		path.set ("assets/images/alicemaze/b-bottom.png", "assets/images/alicemaze/b-bottom.png");
		type.set ("assets/images/alicemaze/b-bottom.png", AssetType.IMAGE);
		path.set ("assets/images/alicemaze/b-full.png", "assets/images/alicemaze/b-full.png");
		type.set ("assets/images/alicemaze/b-full.png", AssetType.IMAGE);
		path.set ("assets/images/alicemaze/b-hori.png", "assets/images/alicemaze/b-hori.png");
		type.set ("assets/images/alicemaze/b-hori.png", AssetType.IMAGE);
		path.set ("assets/images/alicemaze/b-island.png", "assets/images/alicemaze/b-island.png");
		type.set ("assets/images/alicemaze/b-island.png", AssetType.IMAGE);
		path.set ("assets/images/alicemaze/b-lb.png", "assets/images/alicemaze/b-lb.png");
		type.set ("assets/images/alicemaze/b-lb.png", AssetType.IMAGE);
		path.set ("assets/images/alicemaze/b-left.png", "assets/images/alicemaze/b-left.png");
		type.set ("assets/images/alicemaze/b-left.png", AssetType.IMAGE);
		path.set ("assets/images/alicemaze/b-map.png", "assets/images/alicemaze/b-map.png");
		type.set ("assets/images/alicemaze/b-map.png", AssetType.IMAGE);
		path.set ("assets/images/alicemaze/b-rb.png", "assets/images/alicemaze/b-rb.png");
		type.set ("assets/images/alicemaze/b-rb.png", AssetType.IMAGE);
		path.set ("assets/images/alicemaze/b-right.png", "assets/images/alicemaze/b-right.png");
		type.set ("assets/images/alicemaze/b-right.png", AssetType.IMAGE);
		path.set ("assets/images/alicemaze/b-top.png", "assets/images/alicemaze/b-top.png");
		type.set ("assets/images/alicemaze/b-top.png", AssetType.IMAGE);
		path.set ("assets/images/alicemaze/b-ul.png", "assets/images/alicemaze/b-ul.png");
		type.set ("assets/images/alicemaze/b-ul.png", AssetType.IMAGE);
		path.set ("assets/images/alicemaze/b-ur.png", "assets/images/alicemaze/b-ur.png");
		type.set ("assets/images/alicemaze/b-ur.png", AssetType.IMAGE);
		path.set ("assets/images/alicemaze/b-vert.png", "assets/images/alicemaze/b-vert.png");
		type.set ("assets/images/alicemaze/b-vert.png", AssetType.IMAGE);
		path.set ("assets/images/alicemaze/cleaner.png", "assets/images/alicemaze/cleaner.png");
		type.set ("assets/images/alicemaze/cleaner.png", AssetType.IMAGE);
		path.set ("assets/images/alicemaze/dialogue/alice_dialogue_back.pdn", "assets/images/alicemaze/dialogue/alice_dialogue_back.pdn");
		type.set ("assets/images/alicemaze/dialogue/alice_dialogue_back.pdn", AssetType.TEXT);
		path.set ("assets/images/alicemaze/dialogue/alice_dialogue_back.png", "assets/images/alicemaze/dialogue/alice_dialogue_back.png");
		type.set ("assets/images/alicemaze/dialogue/alice_dialogue_back.png", AssetType.IMAGE);
		path.set ("assets/images/alicemaze/dialogue/OldManNormal.png", "assets/images/alicemaze/dialogue/OldManNormal.png");
		type.set ("assets/images/alicemaze/dialogue/OldManNormal.png", AssetType.IMAGE);
		path.set ("assets/images/alicemaze/dialogue/speak-template.png", "assets/images/alicemaze/dialogue/speak-template.png");
		type.set ("assets/images/alicemaze/dialogue/speak-template.png", AssetType.IMAGE);
		path.set ("assets/images/alicemaze/dialogue/speak_0.png", "assets/images/alicemaze/dialogue/speak_0.png");
		type.set ("assets/images/alicemaze/dialogue/speak_0.png", AssetType.IMAGE);
		path.set ("assets/images/alicemaze/dialogue/wasd.png", "assets/images/alicemaze/dialogue/wasd.png");
		type.set ("assets/images/alicemaze/dialogue/wasd.png", AssetType.IMAGE);
		path.set ("assets/images/alicemaze/dialogue/wasd_a.png", "assets/images/alicemaze/dialogue/wasd_a.png");
		type.set ("assets/images/alicemaze/dialogue/wasd_a.png", AssetType.IMAGE);
		path.set ("assets/images/alicemaze/dialogue/wasd_d.png", "assets/images/alicemaze/dialogue/wasd_d.png");
		type.set ("assets/images/alicemaze/dialogue/wasd_d.png", AssetType.IMAGE);
		path.set ("assets/images/alicemaze/dialogue/wasd_finger.pdn", "assets/images/alicemaze/dialogue/wasd_finger.pdn");
		type.set ("assets/images/alicemaze/dialogue/wasd_finger.pdn", AssetType.TEXT);
		path.set ("assets/images/alicemaze/dialogue/wasd_s.pdn", "assets/images/alicemaze/dialogue/wasd_s.pdn");
		type.set ("assets/images/alicemaze/dialogue/wasd_s.pdn", AssetType.TEXT);
		path.set ("assets/images/alicemaze/dialogue/wasd_s.png", "assets/images/alicemaze/dialogue/wasd_s.png");
		type.set ("assets/images/alicemaze/dialogue/wasd_s.png", AssetType.IMAGE);
		path.set ("assets/images/alicemaze/dialogue/wasd_template.pdn", "assets/images/alicemaze/dialogue/wasd_template.pdn");
		type.set ("assets/images/alicemaze/dialogue/wasd_template.pdn", AssetType.TEXT);
		path.set ("assets/images/alicemaze/dialogue/wasd_w.png", "assets/images/alicemaze/dialogue/wasd_w.png");
		type.set ("assets/images/alicemaze/dialogue/wasd_w.png", AssetType.IMAGE);
		path.set ("assets/images/alicemaze/player.png", "assets/images/alicemaze/player.png");
		type.set ("assets/images/alicemaze/player.png", AssetType.IMAGE);
		path.set ("assets/images/component/bt_orig/comp_alice_alt.png", "assets/images/component/bt_orig/comp_alice_alt.png");
		type.set ("assets/images/component/bt_orig/comp_alice_alt.png", AssetType.IMAGE);
		path.set ("assets/images/component/bt_orig/comp_alice_hover.png", "assets/images/component/bt_orig/comp_alice_hover.png");
		type.set ("assets/images/component/bt_orig/comp_alice_hover.png", AssetType.IMAGE);
		path.set ("assets/images/component/bt_orig/comp_lorri_alt.png", "assets/images/component/bt_orig/comp_lorri_alt.png");
		type.set ("assets/images/component/bt_orig/comp_lorri_alt.png", AssetType.IMAGE);
		path.set ("assets/images/component/bt_orig/comp_lorri_hover.png", "assets/images/component/bt_orig/comp_lorri_hover.png");
		type.set ("assets/images/component/bt_orig/comp_lorri_hover.png", AssetType.IMAGE);
		path.set ("assets/images/component/bt_orig/comp_pepssi_alt.png", "assets/images/component/bt_orig/comp_pepssi_alt.png");
		type.set ("assets/images/component/bt_orig/comp_pepssi_alt.png", AssetType.IMAGE);
		path.set ("assets/images/component/bt_orig/comp_pepssi_hover.png", "assets/images/component/bt_orig/comp_pepssi_hover.png");
		type.set ("assets/images/component/bt_orig/comp_pepssi_hover.png", AssetType.IMAGE);
		path.set ("assets/images/component/bt_orig/comp_ralph_alt.png", "assets/images/component/bt_orig/comp_ralph_alt.png");
		type.set ("assets/images/component/bt_orig/comp_ralph_alt.png", AssetType.IMAGE);
		path.set ("assets/images/component/bt_orig/comp_ralph_hover.png", "assets/images/component/bt_orig/comp_ralph_hover.png");
		type.set ("assets/images/component/bt_orig/comp_ralph_hover.png", AssetType.IMAGE);
		path.set ("assets/images/component/buttonsprites/comp_alice_alt.png", "assets/images/component/buttonsprites/comp_alice_alt.png");
		type.set ("assets/images/component/buttonsprites/comp_alice_alt.png", AssetType.IMAGE);
		path.set ("assets/images/component/buttonsprites/comp_alice_d.png", "assets/images/component/buttonsprites/comp_alice_d.png");
		type.set ("assets/images/component/buttonsprites/comp_alice_d.png", AssetType.IMAGE);
		path.set ("assets/images/component/buttonsprites/comp_lorri_alt.png", "assets/images/component/buttonsprites/comp_lorri_alt.png");
		type.set ("assets/images/component/buttonsprites/comp_lorri_alt.png", AssetType.IMAGE);
		path.set ("assets/images/component/buttonsprites/comp_lorri_d.png", "assets/images/component/buttonsprites/comp_lorri_d.png");
		type.set ("assets/images/component/buttonsprites/comp_lorri_d.png", AssetType.IMAGE);
		path.set ("assets/images/component/buttonsprites/comp_pepssi_alt.png", "assets/images/component/buttonsprites/comp_pepssi_alt.png");
		type.set ("assets/images/component/buttonsprites/comp_pepssi_alt.png", AssetType.IMAGE);
		path.set ("assets/images/component/buttonsprites/comp_pepssi_d.png", "assets/images/component/buttonsprites/comp_pepssi_d.png");
		type.set ("assets/images/component/buttonsprites/comp_pepssi_d.png", AssetType.IMAGE);
		path.set ("assets/images/component/buttonsprites/comp_ralph_alt.png", "assets/images/component/buttonsprites/comp_ralph_alt.png");
		type.set ("assets/images/component/buttonsprites/comp_ralph_alt.png", AssetType.IMAGE);
		path.set ("assets/images/component/buttonsprites/comp_ralph_d.png", "assets/images/component/buttonsprites/comp_ralph_d.png");
		type.set ("assets/images/component/buttonsprites/comp_ralph_d.png", AssetType.IMAGE);
		path.set ("assets/images/component/buttonsprites/comp_rex_alt.png", "assets/images/component/buttonsprites/comp_rex_alt.png");
		type.set ("assets/images/component/buttonsprites/comp_rex_alt.png", AssetType.IMAGE);
		path.set ("assets/images/component/buttonsprites/comp_rex_d.png", "assets/images/component/buttonsprites/comp_rex_d.png");
		type.set ("assets/images/component/buttonsprites/comp_rex_d.png", AssetType.IMAGE);
		path.set ("assets/images/component/buttonsprites/comp_rtg_alt.png", "assets/images/component/buttonsprites/comp_rtg_alt.png");
		type.set ("assets/images/component/buttonsprites/comp_rtg_alt.png", AssetType.IMAGE);
		path.set ("assets/images/component/buttonsprites/comp_rtg_d.png", "assets/images/component/buttonsprites/comp_rtg_d.png");
		type.set ("assets/images/component/buttonsprites/comp_rtg_d.png", AssetType.IMAGE);
		path.set ("assets/images/component/buttonsprites/comp_swap_alt.png", "assets/images/component/buttonsprites/comp_swap_alt.png");
		type.set ("assets/images/component/buttonsprites/comp_swap_alt.png", AssetType.IMAGE);
		path.set ("assets/images/component/buttonsprites/comp_swap_d.png", "assets/images/component/buttonsprites/comp_swap_d.png");
		type.set ("assets/images/component/buttonsprites/comp_swap_d.png", AssetType.IMAGE);
		path.set ("assets/images/component/buttonsprites/template.pdn", "assets/images/component/buttonsprites/template.pdn");
		type.set ("assets/images/component/buttonsprites/template.pdn", AssetType.TEXT);
		path.set ("assets/images/component/comp_alice.png", "assets/images/component/comp_alice.png");
		type.set ("assets/images/component/comp_alice.png", AssetType.IMAGE);
		path.set ("assets/images/component/comp_lorri.png", "assets/images/component/comp_lorri.png");
		type.set ("assets/images/component/comp_lorri.png", AssetType.IMAGE);
		path.set ("assets/images/component/comp_pepssi.png", "assets/images/component/comp_pepssi.png");
		type.set ("assets/images/component/comp_pepssi.png", AssetType.IMAGE);
		path.set ("assets/images/component/comp_ralph.png", "assets/images/component/comp_ralph.png");
		type.set ("assets/images/component/comp_ralph.png", AssetType.IMAGE);
		path.set ("assets/images/component/comp_rex.png", "assets/images/component/comp_rex.png");
		type.set ("assets/images/component/comp_rex.png", AssetType.IMAGE);
		path.set ("assets/images/component/comp_rtg.png", "assets/images/component/comp_rtg.png");
		type.set ("assets/images/component/comp_rtg.png", AssetType.IMAGE);
		path.set ("assets/images/component/comp_swap.png", "assets/images/component/comp_swap.png");
		type.set ("assets/images/component/comp_swap.png", AssetType.IMAGE);
		path.set ("assets/images/component/NH.png", "assets/images/component/NH.png");
		type.set ("assets/images/component/NH.png", AssetType.IMAGE);
		path.set ("assets/images/facts/earth-32x.png", "assets/images/facts/earth-32x.png");
		type.set ("assets/images/facts/earth-32x.png", AssetType.IMAGE);
		path.set ("assets/images/facts/fact0.png", "assets/images/facts/fact0.png");
		type.set ("assets/images/facts/fact0.png", AssetType.IMAGE);
		path.set ("assets/images/facts/fact1.png", "assets/images/facts/fact1.png");
		type.set ("assets/images/facts/fact1.png", AssetType.IMAGE);
		path.set ("assets/images/facts/fact2.png", "assets/images/facts/fact2.png");
		type.set ("assets/images/facts/fact2.png", AssetType.IMAGE);
		path.set ("assets/images/facts/facthide.png", "assets/images/facts/facthide.png");
		type.set ("assets/images/facts/facthide.png", AssetType.IMAGE);
		path.set ("assets/images/found/found-template.pdn", "assets/images/found/found-template.pdn");
		type.set ("assets/images/found/found-template.pdn", AssetType.TEXT);
		path.set ("assets/images/found/found_alice.png", "assets/images/found/found_alice.png");
		type.set ("assets/images/found/found_alice.png", AssetType.IMAGE);
		path.set ("assets/images/found/found_alice_button.png", "assets/images/found/found_alice_button.png");
		type.set ("assets/images/found/found_alice_button.png", AssetType.IMAGE);
		path.set ("assets/images/hub/alice_info.png", "assets/images/hub/alice_info.png");
		type.set ("assets/images/hub/alice_info.png", AssetType.IMAGE);
		path.set ("assets/images/hub/blockout.png", "assets/images/hub/blockout.png");
		type.set ("assets/images/hub/blockout.png", AssetType.IMAGE);
		path.set ("assets/images/hub/components_hero.png", "assets/images/hub/components_hero.png");
		type.set ("assets/images/hub/components_hero.png", AssetType.IMAGE);
		path.set ("assets/images/hub/lorri_info.png", "assets/images/hub/lorri_info.png");
		type.set ("assets/images/hub/lorri_info.png", AssetType.IMAGE);
		path.set ("assets/images/hub/pepssi_info.png", "assets/images/hub/pepssi_info.png");
		type.set ("assets/images/hub/pepssi_info.png", AssetType.IMAGE);
		path.set ("assets/images/hub/ralph_info.png", "assets/images/hub/ralph_info.png");
		type.set ("assets/images/hub/ralph_info.png", AssetType.IMAGE);
		path.set ("assets/images/hub/rex_info.png", "assets/images/hub/rex_info.png");
		type.set ("assets/images/hub/rex_info.png", AssetType.IMAGE);
		path.set ("assets/images/hub/rtg_info.png", "assets/images/hub/rtg_info.png");
		type.set ("assets/images/hub/rtg_info.png", AssetType.IMAGE);
		path.set ("assets/images/hub/swap_info.png", "assets/images/hub/swap_info.png");
		type.set ("assets/images/hub/swap_info.png", AssetType.IMAGE);
		path.set ("assets/images/launchblock/launch-thin-window.png", "assets/images/launchblock/launch-thin-window.png");
		type.set ("assets/images/launchblock/launch-thin-window.png", AssetType.IMAGE);
		path.set ("assets/images/launchblock/launch-thin-window.png.meta", "assets/images/launchblock/launch-thin-window.png.meta");
		type.set ("assets/images/launchblock/launch-thin-window.png.meta", AssetType.TEXT);
		path.set ("assets/images/launchblock/nh-atlas-v.pdn.meta", "assets/images/launchblock/nh-atlas-v.pdn.meta");
		type.set ("assets/images/launchblock/nh-atlas-v.pdn.meta", AssetType.TEXT);
		path.set ("assets/images/launchblock/nh-launch-block.pdn.meta", "assets/images/launchblock/nh-launch-block.pdn.meta");
		type.set ("assets/images/launchblock/nh-launch-block.pdn.meta", AssetType.TEXT);
		path.set ("assets/images/launchblock/nh-launch-block.png.meta", "assets/images/launchblock/nh-launch-block.png.meta");
		type.set ("assets/images/launchblock/nh-launch-block.png.meta", AssetType.TEXT);
		path.set ("assets/images/launchblock/nh-launch-long - Copy.pdn.meta", "assets/images/launchblock/nh-launch-long - Copy.pdn.meta");
		type.set ("assets/images/launchblock/nh-launch-long - Copy.pdn.meta", AssetType.TEXT);
		path.set ("assets/images/launchblock/nh-launch-long-old.pdn.meta", "assets/images/launchblock/nh-launch-long-old.pdn.meta");
		type.set ("assets/images/launchblock/nh-launch-long-old.pdn.meta", AssetType.TEXT);
		path.set ("assets/images/launchblock/nh-launch-long.pdn.meta", "assets/images/launchblock/nh-launch-long.pdn.meta");
		type.set ("assets/images/launchblock/nh-launch-long.pdn.meta", AssetType.TEXT);
		path.set ("assets/images/launchblock/nh-launch-long.png.meta", "assets/images/launchblock/nh-launch-long.png.meta");
		type.set ("assets/images/launchblock/nh-launch-long.png.meta", AssetType.TEXT);
		path.set ("assets/images/launchblock/nh-pastel.png.meta", "assets/images/launchblock/nh-pastel.png.meta");
		type.set ("assets/images/launchblock/nh-pastel.png.meta", AssetType.TEXT);
		path.set ("assets/images/launchblock/nh-postcard - Copy - Copy.png.meta", "assets/images/launchblock/nh-postcard - Copy - Copy.png.meta");
		type.set ("assets/images/launchblock/nh-postcard - Copy - Copy.png.meta", AssetType.TEXT);
		path.set ("assets/images/launchblock/nh-postcard - Copy.pdn.meta", "assets/images/launchblock/nh-postcard - Copy.pdn.meta");
		type.set ("assets/images/launchblock/nh-postcard - Copy.pdn.meta", AssetType.TEXT);
		path.set ("assets/images/launchblock/nh-postcard - Copy.png.meta", "assets/images/launchblock/nh-postcard - Copy.png.meta");
		type.set ("assets/images/launchblock/nh-postcard - Copy.png.meta", AssetType.TEXT);
		path.set ("assets/images/launchblock/nh-postcard-skeu.png.meta", "assets/images/launchblock/nh-postcard-skeu.png.meta");
		type.set ("assets/images/launchblock/nh-postcard-skeu.png.meta", AssetType.TEXT);
		path.set ("assets/images/launchblock/nh-postcard.pdn.meta", "assets/images/launchblock/nh-postcard.pdn.meta");
		type.set ("assets/images/launchblock/nh-postcard.pdn.meta", AssetType.TEXT);
		path.set ("assets/images/launchblock/nh-postcard.png.meta", "assets/images/launchblock/nh-postcard.png.meta");
		type.set ("assets/images/launchblock/nh-postcard.png.meta", AssetType.TEXT);
		path.set ("assets/images/launchblock/other/nh-atlas-v.pdn", "assets/images/launchblock/other/nh-atlas-v.pdn");
		type.set ("assets/images/launchblock/other/nh-atlas-v.pdn", AssetType.TEXT);
		path.set ("assets/images/launchblock/other/nh-launch-block/Atlas_V_551_with_New_Horizons_on_Launch_Pad_41.jpg", "assets/images/launchblock/other/nh-launch-block/Atlas_V_551_with_New_Horizons_on_Launch_Pad_41.jpg");
		type.set ("assets/images/launchblock/other/nh-launch-block/Atlas_V_551_with_New_Horizons_on_Launch_Pad_41.jpg", AssetType.IMAGE);
		path.set ("assets/images/launchblock/other/nh-launch-block/nh-static-atlasv-launch.jpg", "assets/images/launchblock/other/nh-launch-block/nh-static-atlasv-launch.jpg");
		type.set ("assets/images/launchblock/other/nh-launch-block/nh-static-atlasv-launch.jpg", AssetType.IMAGE);
		path.set ("assets/images/launchblock/other/nh-launch-block.pdn", "assets/images/launchblock/other/nh-launch-block.pdn");
		type.set ("assets/images/launchblock/other/nh-launch-block.pdn", AssetType.TEXT);
		path.set ("assets/images/launchblock/other/nh-launch-block.png", "assets/images/launchblock/other/nh-launch-block.png");
		type.set ("assets/images/launchblock/other/nh-launch-block.png", AssetType.IMAGE);
		path.set ("assets/images/launchblock/other/nh-launch-long - Copy.pdn", "assets/images/launchblock/other/nh-launch-long - Copy.pdn");
		type.set ("assets/images/launchblock/other/nh-launch-long - Copy.pdn", AssetType.TEXT);
		path.set ("assets/images/launchblock/other/nh-launch-long-old.pdn", "assets/images/launchblock/other/nh-launch-long-old.pdn");
		type.set ("assets/images/launchblock/other/nh-launch-long-old.pdn", AssetType.TEXT);
		path.set ("assets/images/launchblock/other/nh-launch-long.pdn", "assets/images/launchblock/other/nh-launch-long.pdn");
		type.set ("assets/images/launchblock/other/nh-launch-long.pdn", AssetType.TEXT);
		path.set ("assets/images/launchblock/other/nh-pastel.png", "assets/images/launchblock/other/nh-pastel.png");
		type.set ("assets/images/launchblock/other/nh-pastel.png", AssetType.IMAGE);
		path.set ("assets/images/launchblock/other/nh-postcard - Copy.pdn", "assets/images/launchblock/other/nh-postcard - Copy.pdn");
		type.set ("assets/images/launchblock/other/nh-postcard - Copy.pdn", AssetType.TEXT);
		path.set ("assets/images/launchblock/other/nh-postcard - Copy.png", "assets/images/launchblock/other/nh-postcard - Copy.png");
		type.set ("assets/images/launchblock/other/nh-postcard - Copy.png", AssetType.IMAGE);
		path.set ("assets/images/launchblock/other/nh-postcard.pdn", "assets/images/launchblock/other/nh-postcard.pdn");
		type.set ("assets/images/launchblock/other/nh-postcard.pdn", AssetType.TEXT);
		path.set ("assets/images/launchblock/other/nh-postcard.png", "assets/images/launchblock/other/nh-postcard.png");
		type.set ("assets/images/launchblock/other/nh-postcard.png", AssetType.IMAGE);
		path.set ("assets/images/launchblock/other/pad-norocket.pdn", "assets/images/launchblock/other/pad-norocket.pdn");
		type.set ("assets/images/launchblock/other/pad-norocket.pdn", AssetType.TEXT);
		path.set ("assets/images/launchblock/other/pad-rocket.pdn", "assets/images/launchblock/other/pad-rocket.pdn");
		type.set ("assets/images/launchblock/other/pad-rocket.pdn", AssetType.TEXT);
		path.set ("assets/images/launchblock/pad-norocket.png", "assets/images/launchblock/pad-norocket.png");
		type.set ("assets/images/launchblock/pad-norocket.png", AssetType.IMAGE);
		path.set ("assets/images/launchblock/pad-rocket.png", "assets/images/launchblock/pad-rocket.png");
		type.set ("assets/images/launchblock/pad-rocket.png", AssetType.IMAGE);
		path.set ("assets/images/logo.png", "assets/images/logo.png");
		type.set ("assets/images/logo.png", AssetType.IMAGE);
		path.set ("assets/images/logoflicker.png", "assets/images/logoflicker.png");
		type.set ("assets/images/logoflicker.png", AssetType.IMAGE);
		path.set ("assets/images/menu/buttontemplate - Copy.pdn", "assets/images/menu/buttontemplate - Copy.pdn");
		type.set ("assets/images/menu/buttontemplate - Copy.pdn", AssetType.TEXT);
		path.set ("assets/images/menu/buttontemplate.pdn", "assets/images/menu/buttontemplate.pdn");
		type.set ("assets/images/menu/buttontemplate.pdn", AssetType.TEXT);
		path.set ("assets/images/menu/button_about.png", "assets/images/menu/button_about.png");
		type.set ("assets/images/menu/button_about.png", AssetType.IMAGE);
		path.set ("assets/images/menu/button_back.png", "assets/images/menu/button_back.png");
		type.set ("assets/images/menu/button_back.png", AssetType.IMAGE);
		path.set ("assets/images/menu/button_begin.pdn", "assets/images/menu/button_begin.pdn");
		type.set ("assets/images/menu/button_begin.pdn", AssetType.TEXT);
		path.set ("assets/images/menu/button_begin.png", "assets/images/menu/button_begin.png");
		type.set ("assets/images/menu/button_begin.png", AssetType.IMAGE);
		path.set ("assets/images/menu/button_debug.png", "assets/images/menu/button_debug.png");
		type.set ("assets/images/menu/button_debug.png", AssetType.IMAGE);
		path.set ("assets/images/menu/button_f.png", "assets/images/menu/button_f.png");
		type.set ("assets/images/menu/button_f.png", AssetType.IMAGE);
		path.set ("assets/images/menu/button_facts.png", "assets/images/menu/button_facts.png");
		type.set ("assets/images/menu/button_facts.png", AssetType.IMAGE);
		path.set ("assets/images/menu/button_full.png", "assets/images/menu/button_full.png");
		type.set ("assets/images/menu/button_full.png", AssetType.IMAGE);
		path.set ("assets/images/menu/button_mute.pdn", "assets/images/menu/button_mute.pdn");
		type.set ("assets/images/menu/button_mute.pdn", AssetType.TEXT);
		path.set ("assets/images/menu/button_quit.pdn", "assets/images/menu/button_quit.pdn");
		type.set ("assets/images/menu/button_quit.pdn", AssetType.TEXT);
		path.set ("assets/images/menu/button_quit.png", "assets/images/menu/button_quit.png");
		type.set ("assets/images/menu/button_quit.png", AssetType.IMAGE);
		path.set ("assets/images/menu/button_rand.png", "assets/images/menu/button_rand.png");
		type.set ("assets/images/menu/button_rand.png", AssetType.IMAGE);
		path.set ("assets/images/menu/coordsblock.png", "assets/images/menu/coordsblock.png");
		type.set ("assets/images/menu/coordsblock.png", AssetType.IMAGE);
		path.set ("assets/images/menu/d_warning.pdn", "assets/images/menu/d_warning.pdn");
		type.set ("assets/images/menu/d_warning.pdn", AssetType.TEXT);
		path.set ("assets/images/menu/d_warning.png", "assets/images/menu/d_warning.png");
		type.set ("assets/images/menu/d_warning.png", AssetType.IMAGE);
		path.set ("assets/images/menu/d_warn_cancel.png", "assets/images/menu/d_warn_cancel.png");
		type.set ("assets/images/menu/d_warn_cancel.png", AssetType.IMAGE);
		path.set ("assets/images/menu/d_warn_ok.pdn", "assets/images/menu/d_warn_ok.pdn");
		type.set ("assets/images/menu/d_warn_ok.pdn", AssetType.TEXT);
		path.set ("assets/images/menu/d_warn_ok.png", "assets/images/menu/d_warn_ok.png");
		type.set ("assets/images/menu/d_warn_ok.png", AssetType.IMAGE);
		path.set ("assets/images/menu/full_exit_notice.png", "assets/images/menu/full_exit_notice.png");
		type.set ("assets/images/menu/full_exit_notice.png", AssetType.IMAGE);
		path.set ("assets/images/menu/moons/CharonOrbit.png", "assets/images/menu/moons/CharonOrbit.png");
		type.set ("assets/images/menu/moons/CharonOrbit.png", AssetType.IMAGE);
		path.set ("assets/images/menu/moons/HydraOrbit.png", "assets/images/menu/moons/HydraOrbit.png");
		type.set ("assets/images/menu/moons/HydraOrbit.png", AssetType.IMAGE);
		path.set ("assets/images/menu/moons/KerberosOrbit.png", "assets/images/menu/moons/KerberosOrbit.png");
		type.set ("assets/images/menu/moons/KerberosOrbit.png", AssetType.IMAGE);
		path.set ("assets/images/menu/moons/NixOrbit.png", "assets/images/menu/moons/NixOrbit.png");
		type.set ("assets/images/menu/moons/NixOrbit.png", AssetType.IMAGE);
		path.set ("assets/images/menu/moons/original/Charon.png", "assets/images/menu/moons/original/Charon.png");
		type.set ("assets/images/menu/moons/original/Charon.png", AssetType.IMAGE);
		path.set ("assets/images/menu/moons/original/Hydra.png", "assets/images/menu/moons/original/Hydra.png");
		type.set ("assets/images/menu/moons/original/Hydra.png", AssetType.IMAGE);
		path.set ("assets/images/menu/moons/original/Kerberos.png", "assets/images/menu/moons/original/Kerberos.png");
		type.set ("assets/images/menu/moons/original/Kerberos.png", AssetType.IMAGE);
		path.set ("assets/images/menu/moons/original/Nix.png", "assets/images/menu/moons/original/Nix.png");
		type.set ("assets/images/menu/moons/original/Nix.png", AssetType.IMAGE);
		path.set ("assets/images/menu/moons/original/Styx.png", "assets/images/menu/moons/original/Styx.png");
		type.set ("assets/images/menu/moons/original/Styx.png", AssetType.IMAGE);
		path.set ("assets/images/menu/moons/Pluto.png", "assets/images/menu/moons/Pluto.png");
		type.set ("assets/images/menu/moons/Pluto.png", AssetType.IMAGE);
		path.set ("assets/images/menu/moons/StyxOrbit.png", "assets/images/menu/moons/StyxOrbit.png");
		type.set ("assets/images/menu/moons/StyxOrbit.png", AssetType.IMAGE);
		path.set ("assets/images/menu/splash_x640.jpg", "assets/images/menu/splash_x640.jpg");
		type.set ("assets/images/menu/splash_x640.jpg", AssetType.IMAGE);
		path.set ("assets/images/menu/splash_x640.png", "assets/images/menu/splash_x640.png");
		type.set ("assets/images/menu/splash_x640.png", AssetType.IMAGE);
		path.set ("assets/images/menu/starback.png", "assets/images/menu/starback.png");
		type.set ("assets/images/menu/starback.png", AssetType.IMAGE);
		path.set ("assets/images/menu/startup-splash-hero - Copy.png", "assets/images/menu/startup-splash-hero - Copy.png");
		type.set ("assets/images/menu/startup-splash-hero - Copy.png", AssetType.IMAGE);
		path.set ("assets/images/menu/startup-splash-hero.png", "assets/images/menu/startup-splash-hero.png");
		type.set ("assets/images/menu/startup-splash-hero.png", AssetType.IMAGE);
		path.set ("assets/images/misc/pls.png", "assets/images/misc/pls.png");
		type.set ("assets/images/misc/pls.png", AssetType.IMAGE);
		path.set ("assets/images/mute/Mute.png", "assets/images/mute/Mute.png");
		type.set ("assets/images/mute/Mute.png", AssetType.IMAGE);
		path.set ("assets/images/mute/MuteOn.png", "assets/images/mute/MuteOn.png");
		type.set ("assets/images/mute/MuteOn.png", AssetType.IMAGE);
		path.set ("assets/images/NH.ico", "assets/images/NH.ico");
		type.set ("assets/images/NH.ico", AssetType.BINARY);
		path.set ("assets/images/reference.txt", "assets/images/reference.txt");
		type.set ("assets/images/reference.txt", AssetType.TEXT);
		path.set ("assets/music/menu-main2.wav", "assets/music/menu-main2.wav");
		type.set ("assets/music/menu-main2.wav", AssetType.SOUND);
		path.set ("assets/music/music_credits.txt", "assets/music/music_credits.txt");
		type.set ("assets/music/music_credits.txt", AssetType.TEXT);
		path.set ("assets/sounds/data.wav", "assets/sounds/data.wav");
		type.set ("assets/sounds/data.wav", AssetType.SOUND);
		path.set ("assets/sounds/error.wav", "assets/sounds/error.wav");
		type.set ("assets/sounds/error.wav", AssetType.SOUND);
		path.set ("assets/sounds/get.wav", "assets/sounds/get.wav");
		type.set ("assets/sounds/get.wav", AssetType.SOUND);
		path.set ("assets/sounds/introtone.mp3", "assets/sounds/introtone.mp3");
		type.set ("assets/sounds/introtone.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/introtone.wav", "assets/sounds/introtone.wav");
		type.set ("assets/sounds/introtone.wav", AssetType.SOUND);
		path.set ("assets/sounds/Pickup_Coin.wav", "assets/sounds/Pickup_Coin.wav");
		type.set ("assets/sounds/Pickup_Coin.wav", AssetType.SOUND);
		path.set ("assets/sounds/select.wav", "assets/sounds/select.wav");
		type.set ("assets/sounds/select.wav", AssetType.SOUND);
		path.set ("assets/sounds/signal.wav", "assets/sounds/signal.wav");
		type.set ("assets/sounds/signal.wav", AssetType.SOUND);
		path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		path.set ("__manifest__", "manifest");
		type.set ("__manifest__", AssetType.TEXT);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/alicemap.oep";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/maze.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/fonts/OratorStd.otf";
		path.set (id, id);
		type.set (id, AssetType.FONT);
		id = "assets/images/alicemaze/alice_hit.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-bottom.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-full.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-hori.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-island.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-lb.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-left.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-map.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-rb.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-right.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-top.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-ul.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-ur.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/b-vert.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/cleaner.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/dialogue/alice_dialogue_back.pdn";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/alicemaze/dialogue/alice_dialogue_back.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/dialogue/OldManNormal.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/dialogue/speak-template.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/dialogue/speak_0.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/dialogue/wasd.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/dialogue/wasd_a.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/dialogue/wasd_d.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/dialogue/wasd_finger.pdn";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/alicemaze/dialogue/wasd_s.pdn";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/alicemaze/dialogue/wasd_s.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/dialogue/wasd_template.pdn";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/alicemaze/dialogue/wasd_w.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/alicemaze/player.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/bt_orig/comp_alice_alt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/bt_orig/comp_alice_hover.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/bt_orig/comp_lorri_alt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/bt_orig/comp_lorri_hover.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/bt_orig/comp_pepssi_alt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/bt_orig/comp_pepssi_hover.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/bt_orig/comp_ralph_alt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/bt_orig/comp_ralph_hover.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_alice_alt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_alice_d.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_lorri_alt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_lorri_d.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_pepssi_alt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_pepssi_d.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_ralph_alt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_ralph_d.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_rex_alt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_rex_d.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_rtg_alt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_rtg_d.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_swap_alt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/comp_swap_d.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/buttonsprites/template.pdn";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/component/comp_alice.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/comp_lorri.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/comp_pepssi.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/comp_ralph.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/comp_rex.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/comp_rtg.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/comp_swap.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/component/NH.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/facts/earth-32x.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/facts/fact0.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/facts/fact1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/facts/fact2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/facts/facthide.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/found/found-template.pdn";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/found/found_alice.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/found/found_alice_button.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hub/alice_info.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hub/blockout.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hub/components_hero.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hub/lorri_info.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hub/pepssi_info.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hub/ralph_info.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hub/rex_info.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hub/rtg_info.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hub/swap_info.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/launchblock/launch-thin-window.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/launchblock/launch-thin-window.png.meta";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-atlas-v.pdn.meta";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-launch-block.pdn.meta";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-launch-block.png.meta";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-launch-long - Copy.pdn.meta";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-launch-long-old.pdn.meta";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-launch-long.pdn.meta";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-launch-long.png.meta";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-pastel.png.meta";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-postcard - Copy - Copy.png.meta";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-postcard - Copy.pdn.meta";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-postcard - Copy.png.meta";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-postcard-skeu.png.meta";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-postcard.pdn.meta";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/nh-postcard.png.meta";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/other/nh-atlas-v.pdn";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/other/nh-launch-block/Atlas_V_551_with_New_Horizons_on_Launch_Pad_41.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/launchblock/other/nh-launch-block/nh-static-atlasv-launch.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/launchblock/other/nh-launch-block.pdn";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/other/nh-launch-block.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/launchblock/other/nh-launch-long - Copy.pdn";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/other/nh-launch-long-old.pdn";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/other/nh-launch-long.pdn";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/other/nh-pastel.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/launchblock/other/nh-postcard - Copy.pdn";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/other/nh-postcard - Copy.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/launchblock/other/nh-postcard.pdn";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/other/nh-postcard.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/launchblock/other/pad-norocket.pdn";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/other/pad-rocket.pdn";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/launchblock/pad-norocket.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/launchblock/pad-rocket.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/logo.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/logoflicker.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/buttontemplate - Copy.pdn";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/menu/buttontemplate.pdn";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/menu/button_about.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/button_back.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/button_begin.pdn";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/menu/button_begin.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/button_debug.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/button_f.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/button_facts.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/button_full.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/button_mute.pdn";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/menu/button_quit.pdn";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/menu/button_quit.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/button_rand.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/coordsblock.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/d_warning.pdn";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/menu/d_warning.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/d_warn_cancel.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/d_warn_ok.pdn";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/menu/d_warn_ok.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/full_exit_notice.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/moons/CharonOrbit.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/moons/HydraOrbit.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/moons/KerberosOrbit.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/moons/NixOrbit.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/moons/original/Charon.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/moons/original/Hydra.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/moons/original/Kerberos.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/moons/original/Nix.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/moons/original/Styx.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/moons/Pluto.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/moons/StyxOrbit.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/splash_x640.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/splash_x640.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/starback.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/startup-splash-hero - Copy.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/startup-splash-hero.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/misc/pls.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/mute/Mute.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/mute/MuteOn.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/NH.ico";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/reference.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/music/menu-main2.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/music/music_credits.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/data.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/error.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/get.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/introtone.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/introtone.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Pickup_Coin.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/select.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/signal.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/beep.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/flixel.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__assets_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/arial.ttf";
		className.set (id, __ASSET__assets_fonts_arial_ttf);
		
		type.set (id, AssetType.FONT);
		id = "__manifest__";
		path.set (id, "manifest");
		type.set (id, AssetType.TEXT);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		useManifest = true;
		useManifest = true;
		
		className.set ("assets/fonts/OratorStd.otf", __ASSET__assets_fonts_oratorstd_otf);
		type.set ("assets/fonts/OratorStd.otf", AssetType.FONT);
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		useManifest = true;
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<ByteArray> {
		
		var promise = new Promise<ByteArray> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = BINARY;
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, e) {
				
				promise.error (e);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<ByteArray> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id);
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif ios
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if ios
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, msg) promise.error (msg));
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.readUTFBytes (bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash










































































































































































@:keep @:bind #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_arial_ttf extends null { }



#elseif html5



@:keep #if display private #end class __ASSET__assets_fonts_oratorstd_otf extends lime.text.Font { public function new () { super (); name = "Orator Std Medium"; } } 






































































































































































@:keep #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font { public function new () { super (); name = "Arial"; } } 



#else

@:keep #if display private #end class __ASSET__assets_fonts_oratorstd_otf extends lime.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "assets/fonts/OratorStd.otf"; name = "Orator Std Medium"; super (); }}


#if (windows || mac || linux || cpp)


@:font("C:/HaxeToolkit/haxe/lib/flixel/3,3,12/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/3,3,12/assets/fonts/arial.ttf") #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_oratorstd_otf extends openfl.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "assets/fonts/OratorStd.otf"; name = "Orator Std Medium"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_arial_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_arial_ttf (); src = font.src; name = font.name; super (); }}

#end

#end


#end