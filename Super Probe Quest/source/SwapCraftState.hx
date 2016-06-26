package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;

class SwapCraftState extends FlxState
{
	private var back:FlxSprite;

	private var pauseState:PauseState;
	private var pauseButton:FlxButton;

	override public function create():Void
	{
		back = new FlxSprite(0, 0);
		back.loadGraphic('assets/images/swapcraft/swap_back.png');
		add(back);

		pauseState = new PauseState();
		pauseButton = new FlxButton(10, 10, '', loadPause);
		pauseButton.loadGraphic('assets/images/pause/button_pause.png', false, 32, 32);
		add(pauseButton);

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

	private function loadPause():Void
	{
		Registry.minigamePaused = 'swap';
		pauseState = new PauseState();
		openSubState(pauseState);
	}
}