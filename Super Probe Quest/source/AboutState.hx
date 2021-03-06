package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.effects.FlxFlicker;
import flixel.addons.effects.FlxWaveSprite;
import openfl.Lib;

class AboutState extends FlxState
{
	private var logo:FlxSprite;
	private var aboutText:FlxSprite;
	private var logoWave:FlxWaveSprite;
	private var title:FlxSprite;
	private var controls:FlxSprite;

	private var backButton:FlxButton;

	override public function create():Void
	{
		FlxG.camera.flash(0xff000000, 0.5, null, false);

		logo = new FlxSprite(63, 100);
		logo.loadGraphic('assets/images/misc/logo.png');

		logoWave = new FlxWaveSprite(logo);
		logoWave.strength = 5;
		logoWave.speed = 3;
		add(logoWave);

		FlxFlicker.flicker(logoWave, -1, 0.06, true, false, null, null);

		title = new FlxSprite(278, 20);
		title.loadGraphic('assets/images/about/title_about.png');
		add(title);

		controls = new FlxSprite(0, 0);
		controls.loadGraphic('assets/images/about/about_controls.png');
		add(controls);

		backButton = new FlxButton(10, 10, '', loadMenu);
		backButton.loadGraphic('assets/images/menu/button_back.png', false, 67, 32);
		backButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(backButton);

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
	}
}