package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;

class RexFoundState extends FlxState
{
	private var rexFound:FlxSprite;
	private var okButton:FlxButton;

	override public function create():Void
	{
		FlxG.camera.flash(0xff000000, 1, null, false);

		if (Registry.haveRex != true)
			Registry.partsNo++;

		Registry.haveRex = true;

		rexFound = new FlxSprite(0, 0);
		rexFound.loadGraphic('assets/images/found/found_ralph.png');
		add(rexFound);

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