package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;

class AliceDialogState2 extends FlxState
{
	private var oldman:FlxSprite;
	private var background:FlxSprite;
	private var dialog0:FlxSprite;

	override public function create():Void
	{
		oldman = new FlxSprite(384, 0);
		oldman.loadGraphic('assets/images/alicemaze/dialogue/OldManNormal.png');

		background = new FlxSprite(0, 0);
		background.loadGraphic('assets/images/alicemaze/dialogue/alice_dialogue_back.png');

		dialog0 = new FlxSprite(0, 262);
		dialog0.loadGraphic('assets/images/alicemaze/dialogue/wasd.png');

		add(background);
		add(dialog0);
		//add(oldman);

		super.create();
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		if (FlxG.mouse.justReleased)
		{
			loadNext();
		}

		super.update();
	}	

	private function loadNext():Void
	{
		FlxG.switchState(new AliceState());
	}
}