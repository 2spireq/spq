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
	private var cloud1:FlxSprite;
	private var cloud2:FlxSprite;

	private var backButton:FlxButton;

	override public function create():Void
	{
		FlxG.camera.flash(0xff000000, 0.5, null, false);
	
		back = new FlxSprite(0, 0);
		back.loadGraphic('assets/images/launchblock/skyback.png');
		add(back);

		pad = new FlxSprite(0, 0);
		if (Registry.launchReady == null)
		{
			pad.loadGraphic('assets/images/launchblock/pad-norocket.png');
		}
		else if (Registry.launchReady == true)
		{
			pad.loadGraphic('assets/images/launchblock/pad-rocket.png');
		}
		add(pad);

		cloud0 = new FlxSprite(-215, 20);
		cloud0.loadGraphic('assets/images/launchblock/cloud0.png');
		add(cloud0);

		cloud1 = new FlxSprite(-343, 95);
		cloud1.loadGraphic('assets/images/launchblock/cloud1.png');
		add(cloud1);

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
		{
			cloud0.x += 0.6;
		}
		else if (cloud0.x >= 640)
		{
			cloud0.x = -265;
		}

		if (cloud1.x <= 640)
		{
			cloud1.x += 0.4;
		}
		else if (cloud1.x >= 640)
		{
			cloud1.x = - 393;
		}
		super.update();
	}	

	private function loadMenu():Void
	{
		FlxG.switchState(new PlayState());
	}

}