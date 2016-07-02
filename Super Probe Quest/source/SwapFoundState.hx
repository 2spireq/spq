package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;

class SwapFoundState extends FlxState
{
	private var swapFound:FlxSprite;
	private var okButton:FlxButton;

	override public function create():Void
	{
		FlxG.camera.flash(0xff000000, 1, null, false);

		if (Registry.haveSwap != true)
			Registry.partsNo++;

		Registry.haveSwap = true;

		swapFound = new FlxSprite(0, 0);
		swapFound.loadGraphic('assets/images/found/found_swap.png');
		add(swapFound);

		okButton = new FlxButton(196, 420, '', loadPlay);
		okButton.loadGraphic('assets/images/found/found_swap_button.png', false, 247, 53);
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