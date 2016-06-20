package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;

class AliceTitleState extends FlxState
{
	private var background:FlxSprite;
	private var dialog0:FlxButton;

	override public function create():Void
	{
		FlxG.camera.flash(0xffffffff, 1, null, false);

		background = new FlxSprite(0, 0);
		background.loadGraphic('assets/images/alicemaze/dialogue/alice_dialogue_back.png');

		dialog0 = new FlxButton(223, 452, '', loadNext);
		dialog0.loadGraphic('assets/images/alicemaze/dialogue/title_next.png', false, 194, 29);

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
		super.update();
	}	

	private function loadNext():Void
	{
		FlxG.switchState(new AliceDialogState());
	}

}