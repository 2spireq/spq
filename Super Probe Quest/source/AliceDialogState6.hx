package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;

class AliceDialogState6 extends FlxState
{
	private var oldman:FlxSprite;
	private var background:FlxSprite;
	private var dialog0:FlxSprite;
	private var tag:FlxSprite;

	override public function create():Void
	{
		oldman = new FlxSprite(384, 6);
		oldman.loadGraphic('assets/images/alicemaze/dialogue/OldManAngry.png');

		background = new FlxSprite(0, 0);
		background.loadGraphic('assets/images/alicemaze/dialogue/alice_dialogue_back.png');

		dialog0 = new FlxSprite(0, 262);
		dialog0.loadGraphic('assets/images/alicemaze/dialogue/speak_5.png');

		tag = new FlxSprite(0, 224);
		tag.loadGraphic('assets/images/alicemaze/dialogue/tag.png');

		add(background);
		add(dialog0);
		add(oldman);
		add(tag);

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