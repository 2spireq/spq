package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;

class BeginWarnState extends FlxState
{
	private var warnDialog:FlxSprite;

	private var warnButtonOk:FlxButton;
	private var warnButtonCancel:FlxButton;

	private var starBack:FlxSprite;

	override public function create():Void
	{
		FlxG.camera.flash(0xff000000, 0.5, null, false);
		
		warnDialog = new FlxSprite(160, 120);
		warnDialog.loadGraphic('assets/images/menu/d_warning.png');

		warnButtonOk = new FlxButton(174, 300, '', loadPlay);
		warnButtonOk.loadGraphic('assets/images/menu/d_warn_ok.png', false, 126, 32);
		warnButtonOk.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');

		warnButtonCancel = new FlxButton(340, 300, '', loadMenu);
		warnButtonCancel.loadGraphic('assets/images/menu/d_warn_cancel.png', false, 126, 32);
		warnButtonCancel.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');

		starBack = new FlxSprite(0, 0);
		starBack.loadGraphic('assets/images/menu/starback.png');

		add(starBack);
		add(warnDialog);
		add(warnButtonOk);
		add(warnButtonCancel);

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
		FlxG.switchState(new PlayIntroState());
	}

	private function loadMenu():Void
	{
		FlxG.switchState(new MenuState());
	}
}