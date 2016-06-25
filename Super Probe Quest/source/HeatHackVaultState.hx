package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;

class HeatHackVaultState extends FlxState
{
	private var back:FlxSprite;
	private var backTop:FlxSprite;
	private var grille:FlxSprite;

	private var lever:FlxButton;

	private var opening:Bool;
	private var openingFinished:Bool;

	override public function create():Void
	{
		Registry.haveHeat = true;

		back = new FlxSprite(0, 0);
		back.loadGraphic('assets/images/heathack/vault_back.png');
		add(back);

		grille = new FlxSprite(61, 88);
		grille.loadGraphic('assets/images/heathack/vault_grille.png');
		add(grille);

		backTop	 = new FlxSprite(0, 0);
		backTop.loadGraphic('assets/images/heathack/vault_back_top.png');
		add(backTop);

		lever = new FlxButton(278, 407, '', open);
		lever.loadGraphic('assets/images/heathack/lever.png', false, 86, 16);
		lever.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(lever);

		super.create();
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		if (opening)
		{
			if (grille.y > -88)
				grille.y -= 2;
			
			if (grille.y == -88)
			{
				FlxG.camera.fade(0xff000000, 1, loadNext, false);
				opening = false;
			}
		}

		super.update();
	}	

	private function open():Void
	{
		opening = true;
	}

	private function loadNext():Void
	{
		FlxG.switchState(new PlayState());
	}
}