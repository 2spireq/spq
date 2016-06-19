package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;

class AliceDialogState7 extends FlxState
{
	private var background:FlxSprite;
	private var dialog0:FlxSprite;
	
	override public function create():Void
	{
		background = new FlxSprite(0, 0);
		background.loadGraphic('assets/images/alicemaze/dialogue/alice_dialogue_back.png');

		dialog0 = new FlxSprite(0, 262);
		dialog0.loadGraphic('assets/images/alicemaze/dialogue/wasd.png');

		add(background);
		add(dialog0);

		super.create();
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		if (FlxG.mouse.justReleased)
			FlxG.camera.fade(0xff000000, 1, loadNext, false);

		super.update();
	}	

	private function loadNext():Void
	{
		FlxG.switchState(new AliceState());
	}
}