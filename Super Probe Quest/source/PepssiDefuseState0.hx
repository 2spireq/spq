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

	private var buttonPeach:FlxButton;
	private var buttonBlue:FlxButton;
	private var buttonPink:FlxButton;
	private var buttonLime:FlxButton;

	private var defusedPeach:Bool = false;
	private var defusedBlue:Bool = false;
	private var defusedPink:Bool = false;
	private var defusedLime:Bool = false;

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

		buttonPeach = new FlxButton(147, 96, '', defPeach);
		buttonPeach.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		if (defusedPeach == false)
			buttonPeach.loadGraphic('assets/images/pepssiwire/bpeach.png', false, 32, 32);
		add(buttonPeach);

		buttonBlue = new FlxButton(187, 96, defBlue);
		buttonBlue.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		if (defusedBlue == false)
			buttonBlue.loadGraphic('assets/images/pepssiwire/bblue.png', false, 32, 32);
		add(buttonBlue);

		buttonPink = new FlxButton(187, 96, defPink);
		buttonPink.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		if (defusedPink == false)
			buttonPink.loadGraphic('assets/images/pepssiwire/bpink.png', false, 32, 32);
		add(buttonPink);

		buttonLime = new FlxButton(187, 96, defLime);
		buttonLime.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		if (defusedLime == false)
			buttonLime.loadGraphic('assets/images/pepssiwire/bLime.png', false, 32, 32);
		add(buttonLime);

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

	private function defPeach():Void
	{
		if (defusedPeach == false)
			defusedPeach = true;
	}

	private function defBlue():Void
	{
		if (defusedBlue == false)
			defusedBlue = true;
	}

	private function defPink():Void
	{
		if (defusedPink == false)
			defusedPink = true;
	}

	private function defLime():Void
	{
		if (defusedLime == false)
			defusedLime = true;
	}
}