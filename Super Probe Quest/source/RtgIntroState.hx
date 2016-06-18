package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;

class RtgIntroState extends FlxState
{
	private var email:FlxSprite;
	private var buttonNext:FlxButton;

	override public function create():Void
	{
		FlxG.camera.flash(0xff000000, 1, null, false);

		email = new FlxSprite(0, 0);
		email.loadGraphic('assets/images/rtgrun/rtgemail.png');
		add(email);

		buttonNext = new FlxButton(287, 430, '', loadNext);
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

	private function loadNext():Void
	{
		FlxG.switchState(new RtgRunState());
	}

}