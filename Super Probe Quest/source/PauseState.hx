package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class PauseState extends FlxSubState
{
	private var testSprite:FlxSprite;

	override public function create():Void
	{
		/*testSprite = new FlxSprite(0, 0);
		testSprite.loadGraphic('assets/images/rtgrun/playersprite.png');
		add(testSprite);*/

		super.create();
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{	
		if (FlxG.keys.justPressed.ESCAPE)
			close();

		super.update();
	}	

	private function loadMenu():Void
	{
		FlxG.switchState(new PlayState());
	}

}