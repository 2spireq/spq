package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.addons.text.FlxTypeText;
import flixel.addons.ui.FlxInputText;

class HeatHackIntroState extends FlxState
{
	private var background:FlxSprite;
	private var statement:FlxTypeText;
	private var incorrect:FlxTypeText;
	private var input:FlxInputText;
	private var enterPressed:Bool;

	override public function create():Void
	{
		enterPressed = false;

		background = new FlxSprite(0, 0);
		background.loadGraphic('assets/images/heathack/heat_back.png');
		add(background);

		statement = new FlxTypeText(165, 153, 310, 'ENTER PASSWORD\nOne attempt remaining\nPress enter to submit', 8, true);
		statement.delay = 0.1;
		statement.eraseDelay = 0.1;
		statement.showCursor = false;
		statement.prefix = 'CRYPTOPROTECT: ';
		statement.setTypingVariation(0.5, true);
		statement.color = 0x8811EE11;
		add(statement);
		statement.start(0.02, false, false, null);

		incorrect = new FlxTypeText(165, 200, 310, 'Incorrect password\nNow proceeding to security questions\nFor security questions, enter the number corresponding to your choice.\nPress space to continue', 8, true);
		incorrect.delay = 0.1;
		incorrect.eraseDelay = 0.1;
		incorrect.showCursor = false;
		incorrect.setTypingVariation(0.5, true);
		incorrect.color = 0xFFff0000;

		input = new FlxInputText(165, 185, 310, 8, 0x8811EE11, 0x00000000, true);
		input.passwordMode = true;
		input.maxLength = 32;
		input.hasFocus = true;
		input.callback = inputEntered;
		add(input);

		super.create();
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		if (FlxG.keys.justPressed.SPACE && enterPressed == true)
			FlxG.switchState(new HeatHackState());

		super.update();
	}	

	private function inputEntered(text:String, action:String):Void
	{
		if (action == FlxInputText.ENTER_ACTION)
		{
			add(incorrect);
			incorrect.start(0.02, false, false, null);
			enterPressed = true;
		}
	}
}