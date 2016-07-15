package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;

class LaunchIntroState extends FlxState
{
	private var background:FlxSprite;
	private var nametag:FlxSprite;
	private var text0:FlxSprite;

	private var buttonNext:FlxButton;

	override public function create():Void
	{
		FlxG.camera.flash(0xffffffff, 1, null, false);

		background = new FlxSprite(0, 0);
		background.loadGraphic('assets/images/launchblock/launchintro.png');
		add(background);

		buttonNext = new FlxButton(287, 430, '', fadeNext);
		buttonNext.loadGraphic('assets/images/menu/button_f.png', false, 67, 32);
		buttonNext.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(buttonNext);

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

	private function fadeNext():Void
	{
		FlxG.camera.fade(0xffffffff, 1, loadNext, false);
	}

	private function loadNext():Void
	{
		FlxG.switchState(new PadState());
	}
}