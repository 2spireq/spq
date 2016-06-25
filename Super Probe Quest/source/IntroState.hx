package;

import flixel.FlxG;
import flixel.system.FlxSound;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.effects.FlxFlicker;
import flixel.addons.effects.FlxWaveSprite;

class IntroState extends FlxState
{
	private var logo:FlxSprite;
	private var pointFlicker:FlxSprite;

	private var logoWave:FlxWaveSprite;
	private var introTone:FlxSound;

	override public function create():Void
	{
		trace('SUPER PROBE QUEST');
		trace('Console output for debugging only - no attention required');
		trace(FlxG.VERSION);

		logo = new FlxSprite();
		logo.loadGraphic('assets/images/misc/logo.png');
		logo.x = 63;
		logo.y = 218;

		pointFlicker = new FlxSprite();
		pointFlicker.loadGraphic('assets/images/misc/logoflicker.png');
		pointFlicker.x = 360;
		pointFlicker.y = 225;

		logoWave = new FlxWaveSprite(logo);
		logoWave.strength = 5;
		logoWave.speed = 3;

		add(logoWave);
		add(pointFlicker);

		FlxG.sound.play('assets/sounds/introtone.wav');

		FlxG.camera.fade(0xff000000, 1.5, loadMenu, false);
		FlxG.camera.shake(0.008, 0.2);
		FlxFlicker.flicker(logoWave, 0.6, 0.06, true, false, null, null);
		FlxFlicker.flicker(pointFlicker, 1.5, 0.02, true, false, null, null);

		FlxG.mouse.visible = false;

		super.create();
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
	}	

	private function loadMenu():Void
	{
		FlxG.switchState(new MenuState());
		FlxG.camera.flash(FlxColor.BLACK, 3);
	}
}