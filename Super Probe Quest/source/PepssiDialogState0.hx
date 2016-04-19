package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.addons.effects.FlxGlitchSprite;
import flixel.addons.display.FlxExtendedSprite;

class PepssiDialogState0 extends FlxState
{
	private var background:FlxSprite;
	private var backgroundGlitch:FlxGlitchSprite;

	private var backText:FlxSprite;

	private var parcel:FlxButton;

	override public function create():Void
	{
		background = new FlxSprite(0, 0);
		background.loadGraphic('assets/images/pepssiwire/dialogback.png');
		add(background);

		backgroundGlitch = new FlxGlitchSprite(background);
		backgroundGlitch.strength = 10;
		backgroundGlitch.size = 10;
		add(backgroundGlitch);

		backText = new FlxSprite(124, 100);
		backText.loadGraphic('assets/images/pepssiwire/dialogtext.png');
		add(backText);

		parcel = new FlxButton(190, 768, '', loadNext);
		parcel.loadGraphic('assets/images/pepssiwire/bparcel.png', false, 260, 216);
		add(parcel);

		super.create();
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		if (parcel.y > 200)
			parcel.y -= 10;

		super.update();
	}	

	private function loadNext():Void
	{
		FlxG.switchState(new PepssiDefuseState0());
	}
}