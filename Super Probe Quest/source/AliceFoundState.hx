package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;

class AliceFoundState extends FlxState
{
	private var aliceFound:FlxSprite;
	private var okButton:FlxButton;
	//private var aliceBackdrop:FlxSprite;

	override public function create():Void
	{
		FlxG.camera.flash(0xff000000, 1, null, false);

		if (Registry.haveAlice != true)
			Registry.partsNo++;

		Registry.haveAlice = true;

		aliceFound = new FlxSprite(0, 0);
		aliceFound.loadGraphic('assets/images/found/found_alice.png');
		add(aliceFound);

		//aliceBackdrop = new FlxSprite(200, 424);
		//aliceBackdrop.loadGraphic('assets/images/found/alice_button_backdrop.png');
		//add(aliceBackdrop);

		okButton = new FlxButton(196, 420, '', loadPlay);
		okButton.loadGraphic('assets/images/found/found_alice_button.png', false, 247, 53);
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