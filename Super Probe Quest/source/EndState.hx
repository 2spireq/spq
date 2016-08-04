package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;

class EndState extends FlxState
{
	private var back:FlxSprite;
	private var okButton:FlxButton;

	override public function create():Void
	{
		FlxG.camera.flash(0xff000000, 3, null, false);

		back = new FlxSprite(0, 0);
		back.loadGraphic('assets/images/menu/endscreen.png');
		add(back);

		okButton = new FlxButton(287, 430, '', fadeNext);
		okButton.loadGraphic('assets/images/menu/button_f.png', false, 67, 32);
		okButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(okButton);

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
		FlxG.camera.fade(0xff000000, 1, loadNext, false);
	}

	private function loadNext():Void
	{
		FlxG.switchState(new MenuState());
	}
}