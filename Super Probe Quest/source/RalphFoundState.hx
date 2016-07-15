package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;

class RalphFoundState extends FlxState
{
	private var ralphFound:FlxSprite;
	private var okButton:FlxButton;

	override public function create():Void
	{
		FlxG.camera.flash(0xff000000, 1, null, false);

		if (Registry.haveRalph != true)
			Registry.partsNo++;

		Registry.haveRalph = true;

		ralphFound = new FlxSprite(0, 0);
		ralphFound.loadGraphic('assets/images/found/found_ralph.png');
		add(ralphFound);

		okButton = new FlxButton(196, 420, '', loadPlay);
		okButton.loadGraphic('assets/images/found/found_ralph_button.png', false, 247, 53);
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