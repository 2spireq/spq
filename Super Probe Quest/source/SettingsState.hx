package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;

class SettingsState extends FlxState
{
	private var starBack:FlxSprite;
	private var header:FlxSprite;

	private var fullscreenButton:FlxButton;
	private var soundButton:FlxButton;
	private var backButton:FlxButton;

	override public function create():Void
	{
		FlxG.camera.flash(0xff000000, 0.5, null, false);
		
		//FlxG.sound.play('assets/music/rtg_main.mp3', 1, true, false);

		starBack = new FlxSprite(0, 0);
		starBack.loadGraphic('assets/images/hub/starback_2.png');
		add(starBack);

		header = new FlxSprite(252, 10);
		header.loadGraphic('assets/images/settings/title_settings.png');
		add(header);

		backButton = new FlxButton(10, 10, '', loadMenu);
		backButton.loadGraphic('assets/images/menu/button_back.png', false, 67, 32);
		backButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(backButton);

		fullscreenButton = new FlxButton(10, 100, '', toggleFullscreen);
		fullscreenButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		if (FlxG.fullscreen == false)
			fullscreenButton.loadGraphic('assets/images/settings/button_fullscreen_alt.png', false, 163, 32);
		else if (FlxG.fullscreen == true)
			fullscreenButton.loadGraphic('assets/images/settings/button_fullscreen.png', false, 163, 32);
		add(fullscreenButton);

		soundButton = new FlxButton(10, 150, '', toggleSound);
		soundButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		if (FlxG.sound.muted == false)
			soundButton.loadGraphic('assets/images/settings/button_sound.png', false, 163, 32);
		else if (FlxG.sound.muted == true)
			soundButton.loadGraphic('assets/images/settings/button_sound_alt.png', false, 163, 32);
		add(soundButton);

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

	private function toggleFullscreen():Void
	{
		FlxG.fullscreen = !FlxG.fullscreen;

		if (FlxG.fullscreen == false)
			fullscreenButton.loadGraphic('assets/images/settings/button_fullscreen_alt.png', false, 163, 32);
		else if (FlxG.fullscreen == true)
			fullscreenButton.loadGraphic('assets/images/settings/button_fullscreen.png', false, 163, 32);

	}

	private function toggleSound():Void
	{
		//FlxG.sound.muted = !FlxG.sound.muted;

		if (FlxG.sound.muted == false)
		{
			FlxG.sound.muted = true;
			soundButton.loadGraphic('assets/images/settings/button_sound_alt.png', false, 163, 32);
		}
		else if (FlxG.sound.muted == true)
		{
			FlxG.sound.muted = false;
			soundButton.loadGraphic('assets/images/settings/button_sound.png', false, 163, 32);
		}
	}
}