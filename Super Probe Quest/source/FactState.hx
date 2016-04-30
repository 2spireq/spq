package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import Math;

class FactState extends FlxState
{
	private var randDispList = new Map<Int, String>();

	private var factHolder:FlxSprite;
	private var factBlock:FlxSprite;

	private var buttonBack:FlxButton;
	private var buttonR:FlxButton;

	private var dispList = new List<Int>();
	private var randChoose:Int;
	private var item:String;

	private var loadHolder:Int;

	override public function create():Void
	{
		FlxG.camera.flash(0xff000000, 0.5, null, false);

		randDispList = [1 => 'f0', 2 => 'f1', 3 => 'f2', 4 => 'f3'];
		
		loadHolder = 0;

		randFact();
		add(factHolder);

		trace(item);
		trace(randDispList[1]);

		/*factBlock = new FlxSprite(83, 149);
		factBlock.loadGraphic('assets/images/facts/facthide.png');*/

		buttonBack = new FlxButton(10, 10, loadMenu);
		buttonBack.loadGraphic('assets/images/menu/button_back.png', false, 67, 32);
		buttonBack.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');

		buttonR = new FlxButton(304, 360, randFact);
		buttonR.loadGraphic('assets/images/menu/button_rand.png', false, 32, 32);
		buttonR.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');

		add(buttonBack);
		add(buttonR);

		super.create();
	}

	override public function destroy():Void
	{
		factHolder.destroy();
		super.destroy();
	}

	override public function update():Void
	{
		
		super.update();
	}	

	public function loadFact(?no:Int):Void
	{
		factHolder = new FlxSprite(83, 149);

		if (no == 0)
		{
			factHolder.loadGraphic('assets/images/facts/fact0.png');
			add(factHolder);
			trace('0');
		}
		else if (no == 1)
		{
			factHolder.loadGraphic('assets/images/facts/fact1.png');
			add(factHolder);
			trace('1');
		}
		else if (no == 2)
		{
			factHolder.loadGraphic('assets/images/facts/fact2.png');
			add(factHolder);
			trace('2');
		}
		else if (no == 3)
		{
			factHolder.loadGraphic('assets/images/facts/fact3.png');
			add(factHolder);
			trace('3');
		}
	}

	private function loadMenu():Void
	{
		FlxG.switchState(new MenuState());
	}

	public function randFact():Void
	{
		loadFact(loadHolder);

		if (loadHolder == 3)
			loadHolder = 0;
		else
			loadHolder++;
	}
}