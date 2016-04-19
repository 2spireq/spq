package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import openfl.Lib;

class AboutState extends FlxState
{

	private var logo:FlxSprite;
	private var aboutText:FlxSprite;
	private var stemLogo:FlxSprite;

	private var backButton:FlxButton;

	override public function create():Void
	{
		FlxG.camera.flash(0xff000000, 0.5, null, false);

		logo = new FlxSprite(63, 100);
		logo.loadGraphic('assets/images/logo.png');
		add(logo);

		stemLogo = new FlxSprite(63, 300);
		stemLogo.loadGraphic('assets/images/about/stemlogo.png');
		add(stemLogo);

		backButton= new FlxButton(10, 10, '', loadMenu);
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
		
		super.update();
	}	

	private function loadMenu():Void
	{
		FlxG.switchState(new MenuState());
	}
}