package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;

class AliceFoundState extends FlxState
{
	private var _aliceFound:FlxSprite;
	private var _okButton:FlxButton;
	private var _aliceBackdrop:FlxSprite;

	public var haveAlice:Bool;

	override public function create():Void
	{
		if (Registry.haveAlice != true)
		{
			Registry.partsNo++;
			//Registry.partsNo += 1;
		}

		Registry.haveAlice = true;

		_aliceFound = new FlxSprite(0, 0);
		_aliceFound.loadGraphic('assets/images/found/found_alice.png');
		add(_aliceFound);

		_aliceBackdrop = new FlxSprite(200, 424);
		_aliceBackdrop.loadGraphic('assets/images/found/alice_button_backdrop.png');
		add(_aliceBackdrop);

		_okButton = new FlxButton(196, 420, '', loadPlay);
		_okButton.loadGraphic('assets/images/found/found_alice_button.png', false, 247, 53);
		_okButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(_okButton);

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