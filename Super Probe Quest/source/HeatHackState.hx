package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.addons.text.FlxTypeText;
import flixel.addons.ui.FlxInputText;

class HeatHackState extends FlxState
{
	private var pauseState:PauseState;
	private var pauseButton:FlxButton;
	private var background:FlxSprite;
	private var question:FlxTypeText;
	private var input:FlxInputText;

	/*private var choiceButton0:FlxButton;
	private var choiceButton1:FlxButton;*/

	override public function create():Void
	{
		background = new FlxSprite(0, 0);
		background.loadGraphic('assets/images/heathack/heat_back.png');
		add(background);

		question = new FlxTypeText(165, 153, 310, 'Question 1. Name the scientist who first discovered Pluto.\n1. Clyde Tombaugh\n2. Other Person 1\n3. Other Person 2\n4. Other Person 3\n', 8, true);
		question.delay = 0.1;
		question.eraseDelay = 0.1;
		question.showCursor = false;
		question.prefix = 'CRYPTOPROTECT: ';
		question.setTypingVariation(0.5, true);
		question.color = 0x8811EE11;
		add(question);
		question.start(0.02, false, false, null);

		/*choiceButton0 = new FlxButton(100, 100, '', choice0);
		choiceButton0.loadGraphic('assets/images/heathack/choice_button.png', false, 94, 26);
		add(choiceButton0);

		choiceButton1 = new FlxButton(200, 100, '', choice1);
		choiceButton1.loadGraphic('assets/images/heathack/choice_button.png', false, 94, 26);
		add(choiceButton1);*/

		input = new FlxInputText(165, 300, 310, 8, 0x8811EE11, 0x00000000, true);
		input.maxLength = 2;
		input.hasFocus = true;
		//input.callback = inputEntered;
		add(input);

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

	private function choice0():Void
	{

	}

	private function choice1():Void
	{

	}
}