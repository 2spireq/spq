package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxSpriteUtil;

class HubPauseState extends FlxSubState
{
	private var pauseBack:FlxSprite;
	private var exitWarning:FlxSprite;

	private var playButton:FlxButton;
	private var exitButton:FlxButton;
	private var exitButtonOk:FlxButton;
	private var exitButtonCancel:FlxButton;
	private var fullscreenButton:FlxButton;

	override public function create():Void
	{
		pauseBack = new FlxSprite(0, 0);
		pauseBack.loadGraphic('assets/images/pause/pause_back.png');
		add(pauseBack);

		exitWarning = new FlxSprite(160, 120);
		exitWarning.loadGraphic('assets/images/pause/h_warning.png');

		playButton = new FlxButton(260, 100, close);
		playButton.loadGraphic('assets/images/pause/button_play.png', false, 121, 32);
		playButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(playButton);

		exitButton = new FlxButton(260, 150, exit);
		exitButton.loadGraphic('assets/images/pause/button_exit.png', false, 121, 32);
		exitButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(exitButton);

		exitButtonOk = new FlxButton(174, 300, '', loadMenu);
		exitButtonOk.loadGraphic('assets/images/menu/d_warn_ok.png', false, 126, 32);
		exitButtonOk.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');

		exitButtonCancel = new FlxButton(340, 300, '', close);
		exitButtonCancel.loadGraphic('assets/images/menu/d_warn_cancel.png', false, 126, 32);
		exitButtonCancel.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');

		fullscreenButton = new FlxButton(260, 200, fullscreen);
		fullscreenButton.loadGraphic('assets/images/pause/button_fullscreen.png', false, 121, 32);
		add(fullscreenButton);

		super.create();
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{	
		if (FlxG.keys.justPressed.ESCAPE)
			close();

		super.update();
	}	

	private function exit():Void
	{
		add(exitWarning);
		add(exitButtonOk);
		add(exitButtonCancel);
	}

	private function loadMenu():Void
	{
		FlxG.switchState(new MenuState());
	}

	private function fullscreen():Void
	{
		FlxG.fullscreen = !FlxG.fullscreen;
	}
}