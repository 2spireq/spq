package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.addons.text.FlxTypeText;

class HeatHackState extends FlxState
{
	private var pauseState:PauseState;
	private var pauseButton:FlxButton;

	private var background:FlxSprite;
	private var question:FlxTypeText;

	override public function create():Void
	{
		background = new FlxSprite(0, 0);
		background.loadGraphic('assets/images/heathack/heat_back.png');
		add(background);

		question = new FlxTypeText(165, 153, 475, 'Test', 8, true);
		question.delay = 0.1;
		question.eraseDelay = 0.1;
		question.showCursor = true;
		question.cursorBlinkSpeed = 1.5;
		question.prefix = 'C:\\New Horizons>';
		question.setTypingVariation(0.5, true);
		question.color = 0x8811EE11;
		add(question);

		question.start(0.02, false, false, null);

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
		Registry.minigamePaused = 'heat';
		pauseState = new PauseState();
		openSubState(pauseState);
	}
}