package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxAngle;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class RexAir extends FlxSprite
{
	public function new(X:Float=0, Y:Float=0) 
	{
	    super(X, Y);
	    loadGraphic('assets/images/rexjump/rexair.png', false, 13, 13);
	}

	override public function update():Void
	{
		super.update();
	}
}