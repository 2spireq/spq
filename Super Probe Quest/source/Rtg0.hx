package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxAngle;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.ogmo.FlxOgmoLoader;

class Rtg0 extends FlxSprite
{
	public function new(X:Float=0, Y:Float=0) 
	{
	    super(X, Y);
	    loadGraphic('assets/images/rtgrun/p1.png', false, 8, 8);
	}

	override public function update():Void
	{
		super.update();
	}
}