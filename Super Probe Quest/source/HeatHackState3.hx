package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.addons.text.FlxTypeText;
import flixel.addons.ui.FlxInputText;
import Std;

class HeatHackState3 extends FlxState
{
	private var pauseState:PauseState;
	private var pauseButton:FlxButton;
	private var background:FlxSprite;
	private var question:FlxTypeText;
	private var correct:FlxTypeText;
	private var incorrect:FlxTypeText;
	private var input:FlxInputText;
	private var isCorrect:String;

	override public function create():Void
	{
		isCorrect = 'maybe';
		background = new FlxSprite(0, 0);
		background.loadGraphic('assets/images/heathack/heat_back.png');
		add(background);

		question = new FlxTypeText(165, 153, 310, 'Question 3. In classical mythology, Pluto is the god of which of the following?\n1. Sunshine and happiness\n2. The underworld\n3. The solar system\n4. The sky', 8, true);
		question.delay = 0.1;
		question.eraseDelay = 0.1;
		question.showCursor = false;
		question.prefix = 'CRYPTOPROTECT: ';
		question.setTypingVariation(0.5, true);
		question.color = 0x8811EE11;
		add(question);
		question.start(0.02, false, false, null);

		input = new FlxInputText(165, 220, 310, 8, 0x8811EE11, 0x00000000, true);
		input.maxLength = 2;
		input.hasFocus = true;
		input.callback = inputEntered;
		add(input);

		correct = new FlxTypeText(165, 235, 310, 'Correct. Now proceeding to next security question\nPress space to continue', 8, true);
		correct.delay = 0.1;
		correct.eraseDelay = 0.1;
		correct.showCursor = false;
		correct.setTypingVariation(0.5, true);
		correct.color = 0x8811EE11;

		incorrect = new FlxTypeText(165, 235, 310, 'Incorrect\nAccess denied\nPress space to continue', 8, true);
		incorrect.delay = 0.1;
		incorrect.eraseDelay = 0.1;
		incorrect.showCursor = false;
		incorrect.setTypingVariation(0.5, true);
		incorrect.color = 0xFFff0000;

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
		if (FlxG.keys.justPressed.SPACE)
		{
			if (isCorrect == 'yes')
			{
				question.erase(0.02, false, nextCorrectState);
				correct.erase(0.02, false);
			}
			else if (isCorrect == 'no')
			{
				question.erase(0.02, false, nextIncorrectState);
				incorrect.erase(0.02, false);
			}
		}

		super.update();
	}	

	private function inputEntered(text:String, action:String):Void
	{
		if (action == FlxInputText.ENTER_ACTION)
		{
			if (input.text == '2')
			{
				add(correct);
				correct.start(0.02, false, false, null);
				isCorrect = 'yes';
			}
			else
			{
				add(incorrect);
				incorrect.start(0.02, false, false, null);
				isCorrect = 'no';
			}
		}
	}

	private function loadPause():Void
	{
		Registry.minigamePaused = 'heat';
		pauseState = new PauseState();
		openSubState(pauseState);
	}

	private function nextCorrectState():Void
	{
		FlxG.switchState(new HeatHackState4());
	}

	private function nextIncorrectState():Void
	{
		FlxG.switchState(new HeatHackState());
	}
}