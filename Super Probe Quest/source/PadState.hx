package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class PadState extends FlxState
{
	private var back:FlxSprite;
	private var pad:FlxSprite;
	private var cloud0:FlxSprite;

	private var backButton:FlxButton;

	override public function create():Void
	{
		FlxG.camera.flash(0xff000000, 0.5, null, false);
	
		back = new FlxSprite(0, 0);
		back.loadGraphic('assets/images/launchblock/skyback.png');
		add(back);

		cloud0 = new FlxSprite(-540, 257);
		cloud0.loadGraphic('assets/images/rtgrun/clouds.png');
		add(cloud0);

		pad = new FlxSprite(0, 0);
		/*if (Registry.launchReady == null)
			pad.loadGraphic('assets/images/launchblock/pad-norocket.png');*/
		if (Registry.launchReady == true)
			pad.loadGraphic('assets/images/launchblock/pad-rocket.png');
		else
			pad.loadGraphic('assets/images/launchblock/pad-norocket.png');
		add(pad);

		backButton = new FlxButton(10, 10, '', loadMenu);
		backButton.loadGraphic('assets/images/menu/button_back.png', false, 67, 32);
		backButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(backButton);

		super.create();
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{	
		if (cloud0.x <= 640)
			cloud0.x += 0.3;
		else if (cloud0.x >= 640)
			cloud0.x = -776;

		super.update();
	}	

	private function loadMenu():Void
	{
		FlxG.switchState(new PlayState());
	}

}