package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.addons.effects.FlxGlitchSprite;
import flixel.addons.display.FlxExtendedSprite;

class PlayIntroState3 extends FlxState
{
	private var background:FlxSprite;
	private var nametag:FlxSprite;
	private var text0:FlxSprite;

	private var buttonNext:FlxButton;

	override public function create():Void
	{
		FlxG.camera.flash(0xff000000, 1, null, false);

		background = new FlxSprite(0, 0);
		background.loadGraphic('assets/images/menu/starback.png');
		add(background);

		nametag = new FlxSprite(160, 120);
		nametag.loadGraphic('assets/images/intro/plane.png');
		add(nametag);

		text0 = new FlxSprite(0, 15);
		text0.loadGraphic('assets/images/intro/text2.png');
		add(text0);

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
		FlxG.switchState(new PlayIntroState4());
	}
}