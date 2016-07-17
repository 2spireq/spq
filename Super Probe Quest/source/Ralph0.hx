package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxAngle;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class Ralph0 extends FlxSprite
{
	public function new(X:Float=0, Y:Float=0) 
	{
	    super(X, Y);
	    loadGraphic('assets/images/ralphzero/ralphpart.png', false, 7, 7);
	}

	override public function update():Void
	{
		super.update();
	}

	override public function kill():Void
	{
	    alive = false;
	    FlxTween.tween(this, {alpha: 0, y: y - 16}, .33, {ease: FlxEase.circOut});
	}
}