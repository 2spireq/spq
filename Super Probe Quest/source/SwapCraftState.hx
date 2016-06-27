package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;

class SwapCraftState extends FlxState
{
	private var back:FlxSprite;
	private var tray:FlxSprite;

	private var forward_0:FlxButton;
	private var forward_1:FlxButton;
	private var forward_2:FlxButton;
	private var forward_3:FlxButton;

	private var pauseState:PauseState;
	private var pauseButton:FlxButton;

	override public function create():Void
	{
		back = new FlxSprite(0, 0);
		back.loadGraphic('assets/images/swapcraft/swap_back.png');
		add(back);

		tray = new FlxSprite(0, 416);
		tray.loadGraphic('assets/images/swapcraft/tray.png');
		add(tray);

		forward_0 = new FlxButton(0, 416, '', f0);
		forward_0.loadGraphic('assets/images/swapcraft/forward_0.png', false, 64, 64);
		add(forward_0);

		forward_1 = new FlxButton(64, 416, '', f0);
		forward_1.loadGraphic('assets/images/swapcraft/forward_1.png', false, 64, 64);
		add(forward_1);

		forward_2 = new FlxButton(128, 416, '', f0);
		forward_2.loadGraphic('assets/images/swapcraft/forward_2.png', false, 64, 64);
		add(forward_2);

		forward_3 = new FlxButton(192, 416, '', f0);
		forward_3.loadGraphic('assets/images/swapcraft/forward_3.png', false, 64, 64);
		add(forward_3);

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

	private function f0():Void
	{
		trace('f0');
	}

	private function loadPause():Void
	{
		Registry.minigamePaused = 'swap';
		pauseState = new PauseState();
		openSubState(pauseState);
	}
}