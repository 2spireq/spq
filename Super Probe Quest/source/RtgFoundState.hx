package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;

class RtgFoundState extends FlxState
{
	private var rtgFound:FlxSprite;
	private var okButton:FlxButton;

	override public function create():Void
	{
		FlxG.camera.flash(0xff000000, 1, null, false);

		if (Registry.haveRtg != true)
			Registry.partsNo++;

		Registry.haveRtg = true;

		rtgFound = new FlxSprite(0, 0);
		rtgFound.loadGraphic('assets/images/found/found_rtg.png');
		add(rtgFound);

		okButton = new FlxButton(196, 420, '', loadPlay);
		okButton.loadGraphic('assets/images/found/found_rtg_button.png', false, 247, 53);
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

	private function loadPlay():Void
	{
		FlxG.switchState(new PlayState());
	}
}