package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;

class SwapIntroState extends FlxState
{
	private var email:FlxSprite;
	private var buttonNext:FlxButton;

	override public function create():Void
	{
		FlxG.camera.flash(0xffffffff, 1, null, false);

		email = new FlxSprite(0, 0);
		email.loadGraphic('assets/images/swapcraft/swapemail.png');
		add(email);

		buttonNext = new FlxButton(287, 430, '', fade);
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

	private function fade():Void
	{
		FlxG.camera.fade(0xff000000, 0.4, loadNext, false);
	}

	private function loadNext():Void
	{
		FlxG.switchState(new SwapIntroState2());
	}
}