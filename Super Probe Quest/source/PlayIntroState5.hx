package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.addons.effects.FlxGlitchSprite;
import flixel.addons.display.FlxExtendedSprite;

class PlayIntroState5 extends FlxState
{
	private var background:FlxSprite;

	private var buttonNext:FlxButton;

	override public function create():Void
	{
		FlxG.camera.flash(0xff000000, 1, null, false);

		background = new FlxSprite(0, 0);
		background.loadGraphic('assets/images/intro/tutorial.png');
		add(background);

		buttonNext = new FlxButton(287, 400, '', loadNext);
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
		FlxG.switchState(new PlayState());
	}
}