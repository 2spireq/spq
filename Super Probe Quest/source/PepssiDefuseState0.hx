package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.addons.effects.FlxGlitchSprite;
import flixel.addons.display.FlxExtendedSprite;

class PepssiDefuseState0 extends FlxState
{
	private var background:FlxSprite;
	private var boxSprite:FlxSprite;
	private var backgroundWave:FlxGlitchSprite;

	private var b0:FlxButton;
	private var b1:FlxButton;
	private var b2:FlxButton;
	private var b3:FlxButton;

	private var defused0:Bool = false;
	private var defused1:Bool = false;
	private var defused2:Bool = false;
	private var defused3:Bool = false;

	override public function create():Void
	{
		background = new FlxSprite(0, 0);
		background.loadGraphic('assets/images/pepssiwire/background.png');
		backgroundWave = new FlxGlitchSprite(background);
		add(background);

		backgroundWave.strength = 20;
		backgroundWave.size = 10;
		add(backgroundWave);

		boxSprite = new FlxSprite(147, 96);
		boxSprite.loadGraphic('assets/images/pepssiwire/box.png');
		add(boxSprite);

		b0 = new FlxButton(147, 96);
		b0.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		if (defused0 == false)
			b0.loadGraphic('assets/images/pepssiwire/bpeach.png', false, 32, 32);
		add(b0);

		b1 = new FlxButton(187, 96);
		b1.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		if (defused1 == false)
			b1.loadGraphic('assets/images/pepssiwire/bblue.png', false, 32, 32);
		add(b1);

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
}