package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxBasic;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;
import flixel.util.FlxSave;

class PlayState extends FlxState
{
	/*private var comp_alice:FlxSprite;
	private var comp_lorri:FlxSprite;
	private var comp_pepssi:FlxSprite;
	private var comp_ralph:FlxSprite;
	private var comp_swap:FlxSprite;*/

	private var aliceButton:FlxButton;
	private var lorriButton:FlxButton;
	private var pepssiButton:FlxButton;
	private var ralphButton:FlxButton;
	private var swapButton:FlxButton;
	private var rtgButton:FlxButton;
	private var rexButton:FlxButton;
	private var heatButton:FlxButton;

	private var aliceInfoText:FlxSprite;
	private var lorriInfoText:FlxSprite;
	private var pepssiInfoText:FlxSprite;
	private var ralphInfoText:FlxSprite;
	private var swapInfoText:FlxSprite;
	private var rtgInfoText:FlxSprite;
	private var rexInfoText:FlxSprite;
	private var heatInfoText:FlxSprite;
	private var blockout:FlxSprite;
	private var compHero:FlxSprite;

	private var padButton:FlxButton;

	private var starBack:FlxSprite;

	private var startX:Int = 10;
	private var startY:Int = 30;

	override public function create():Void
	{
		starBack = new FlxSprite(0, 0);
		starBack.loadGraphic('assets/images/hub/starback_2.png');
		add(starBack);

		aliceButton = new FlxButton(startX, startY, '', loadAlice);
		lorriButton = new FlxButton(startX + 66, startY, '', loadLorri);
		pepssiButton = new FlxButton(startX + 132, startY, '', loadPepssi);
		ralphButton = new FlxButton(startX + 198, startY, '', loadRalph);
		swapButton = new FlxButton(startX, startY + 66, '', loadSwap);
		rtgButton = new FlxButton(startX + 66, startY + 66, '', loadRtg);
		rexButton = new FlxButton(startX + 132, startY + 66, '', loadRex);
		heatButton = new FlxButton(startX + 198, startY + 66, '', loadHeat);

		trace(Registry.partsNo);

		if (Registry.haveAlice == true)
		{
			aliceButton.loadGraphic('assets/images/component/buttonsprites/comp_alice_d.png', false, 64, 64);
			trace('ALICE TRUE');
		}
		/*else if (Registry.haveAlice == null)
		{
			aliceButton.loadGraphic('assets/images/component/buttonsprites/comp_alice_alt.png', false, 64, 64);
			trace('ALICE NULL');
		}*/
		else if (Registry.haveAlice == false)
		{
			aliceButton.loadGraphic('assets/images/component/buttonsprites/comp_alice_alt.png', false, 64, 64);
			trace('ALICE FALSE');
		}

		if (Registry.haveLorri == true)
		{
			lorriButton.loadGraphic('assets/images/component/buttonsprites/comp_lorri_d.png', false, 64, 64);
			trace('LORRI TRUE');
		}
		/*else if (Registry.haveLorri == null)
		{
			lorriButton.loadGraphic('assets/images/component/buttonsprites/comp_lorri_alt.png', false, 64, 64);
			trace('LORRI NULL');
		}*/
		else if (Registry.haveLorri == false)
		{
			lorriButton.loadGraphic('assets/images/component/buttonsprites/comp_lorri_alt.png', false, 64, 64);
			trace('LORRI FALSE');
		}

		if (Registry.havePepssi == true)
		{
			pepssiButton.loadGraphic('assets/images/component/buttonsprites/comp_pepssi_d.png', false, 64, 64);
			trace('PEPSSI TRUE');
		}
		/*else if (Registry.havePepssi == null)
		{
			pepssiButton.loadGraphic('assets/images/component/buttonsprites/comp_pepssi_alt.png', false, 64, 64);
			trace('PEPSSI NULL');
		}*/
		else if (Registry.havePepssi == false)
		{
			pepssiButton.loadGraphic('assets/images/component/buttonsprites/comp_pepssi_alt.png', false, 64, 64);
			trace('PEPSSI FALSE');
		}

		if (Registry.haveRalph == true)
		{
			ralphButton.loadGraphic('assets/images/component/buttonsprites/comp_ralph_d.png', false, 64, 64);
			trace('RALPH TRUE');
		}
		/*else if (Registry.haveRalph == null)
		{
			ralphButton.loadGraphic('assets/images/component/buttonsprites/comp_ralph_alt.png', false, 64, 64);
			trace('RALPH NULL');
		}*/
		else if (Registry.haveRalph == false)
		{
			ralphButton.loadGraphic('assets/images/component/buttonsprites/comp_ralph_alt.png', false, 64, 64);
			trace('RALPH FALSE');
		}

		if (Registry.haveSwap == true)
		{
			swapButton.loadGraphic('assets/images/component/buttonsprites/comp_swap_d.png', false, 64, 64);
			trace('SWAP TRUE');
		}
		/*else if (Registry.haveSwap == null)
		{
			swapButton.loadGraphic('assets/images/component/buttonsprites/comp_swap_alt.png', false, 64, 64);
			trace('SWAP NULL');
		}*/
		else if (Registry.haveSwap == false)
		{
			swapButton.loadGraphic('assets/images/component/buttonsprites/comp_swap_alt.png', false, 64, 64);
			trace('SWAP FALSE');
		}

		if (Registry.haveRtg == true)
		{
			rtgButton.loadGraphic('assets/images/component/buttonsprites/comp_rtg_d.png', false, 64, 64);
			trace('RTG TRUE');
		}
		/*else if (Registry.haveRtg == null)
		{
			rtgButton.loadGraphic('assets/images/component/buttonsprites/comp_rtg_alt.png', false, 64, 64);
			trace('RTG NULL');
		}*/
		else if (Registry.haveRtg == false)
		{
			rtgButton.loadGraphic('assets/images/component/buttonsprites/comp_rtg_alt.png', false, 64, 64);
			trace('RTG FALSE');
		}

		if (Registry.haveRex == true)
		{
			rexButton.loadGraphic('assets/images/component/buttonsprites/comp_rex_d.png', false, 64, 64);
			trace('REX TRUE');
		}
		/*else if (Registry.haveRex == null)
		{
			rexButton.loadGraphic('assets/images/component/buttonsprites/comp_rex_alt.png', false, 64, 64);
			trace('REX NULL');
		}*/
		else if (Registry.haveRex == false)
		{
			rexButton.loadGraphic('assets/images/component/buttonsprites/comp_rex_alt.png', false, 64, 64);
			trace('REX FALSE');
		}

		if (Registry.haveHeat == true)
		{
			heatButton.loadGraphic('assets/images/component/buttonsprites/comp_heat_d.png', false, 64, 64);
			trace('HEAT TRUE');
		}
		/*else if (Registry.haveHeat == null)
		{
			heatButton.loadGraphic('assets/images/component/buttonsprites/comp_heat_alt.png', false, 64, 64);
			trace('HEAT NULL');
		}*/
		else if (Registry.haveHeat == false)
		{
			heatButton.loadGraphic('assets/images/component/buttonsprites/comp_heat_alt.png', false, 64, 64);
			trace('HEAT FALSE');
		}

		aliceButton.onOver.callback = aliceInfo;
		aliceButton.onOut.callback = infoRemove;
		aliceButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(aliceButton);

		lorriButton.onOver.callback = lorriInfo;
		lorriButton.onOut.callback = infoRemove;
		lorriButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(lorriButton);

		pepssiButton.onOver.callback = pepssiInfo;
		pepssiButton.onOut.callback = infoRemove;
		pepssiButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(pepssiButton);

		ralphButton.onOver.callback = ralphInfo;
		ralphButton.onOut.callback = infoRemove;
		ralphButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(ralphButton);

		swapButton.onOver.callback = swapInfo;
		swapButton.onOut.callback = infoRemove;
		swapButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(swapButton);

		rtgButton.onOver.callback = rtgInfo;
		rtgButton.onOut.callback = infoRemove;
		rtgButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(rtgButton);
		
		rexButton.onOver.callback = rexInfo;
		rexButton.onOut.callback = infoRemove;
		rexButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(rexButton);

		heatButton.onOver.callback = heatInfo;
		heatButton.onOut.callback = infoRemove;
		heatButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(heatButton);

		compHero = new FlxSprite(startX, startY - 28);
		compHero.loadGraphic('assets/images/hub/components_hero.png');
		add(compHero);

		blockout = new FlxSprite(284, 16);
		blockout.loadGraphic('assets/images/hub/blockout.png');
		add(blockout);

		padButton = new FlxButton(400, 300, '', loadPad);
		padButton.loadGraphic('assets/images/menu/button_pad.png', 131, 32);
		padButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(padButton);

		FlxG.camera.flash(0xff000000, 0.5, null, false);

		super.create();
	}
	
	override public function destroy():Void
	{

		super.destroy();
	}

	override public function update():Void
	{
		//trace(FlxG.mouse.getWorldPosition());
		super.update();
	}	

	private function loadAlice():Void
	{
		trace('loadAlice');
		FlxG.switchState(new AliceDialogState());
	}

	private function loadLorri():Void
	{
		trace('loadLorri');
		//FlxG.switchState(new PlayState());
	}

	private function loadPepssi():Void
	{
		trace('loadPepssi');
		FlxG.switchState(new PepssiDialogState0());
	}

	private function loadRalph():Void
	{
		trace('loadRalph');
		//FlxG.switchState(new PlayState());
	}

	private function loadSwap():Void
	{
		trace('loadSwap');
		//FlxG.switchState(new PlayState());
	}

	private function loadRtg():Void
	{
		trace('loadRtg');
		FlxG.switchState(new RtgRunState());
	}

	private function loadRex():Void
	{
		trace('loadRex');
		//FlxG.switchState(new PlayState());
	}

	private function loadHeat():Void
	{
		trace('loadHeat');
		//FlxG.switchState(new PlayState());
	}

	private function infoRemove():Void
	{
		//trace('infoRemove');

		blockout = new FlxSprite(284, 16);
		blockout.loadGraphic('assets/images/hub/blockout.png');

		add(blockout);
	}

	private function aliceInfo():Void
	{
		//trace('aliceInfo');

		aliceInfoText = new FlxSprite(290, 20);
		aliceInfoText.loadGraphic('assets/images/hub/alice_info.png');

		add(aliceInfoText);
	}

	private function lorriInfo():Void
	{
		//trace('lorriInfo');

		lorriInfoText = new FlxSprite(290, 20);
		lorriInfoText.loadGraphic('assets/images/hub/lorri_info.png');

		add(lorriInfoText);
	}

	private function pepssiInfo():Void
	{
		//trace('pepssiInfo');

		pepssiInfoText = new FlxSprite(290, 20);
		pepssiInfoText.loadGraphic('assets/images/hub/pepssi_info.png');

		add(pepssiInfoText);
	}

	private function ralphInfo():Void
	{
		//trace('ralphInfo');

		ralphInfoText = new FlxSprite(290, 20);
		ralphInfoText.loadGraphic('assets/images/hub/ralph_info.png');

		add(ralphInfoText);
	}

	private function swapInfo():Void
	{
		//trace('swapInfo');

		swapInfoText = new FlxSprite(290, 20);
		swapInfoText.loadGraphic('assets/images/hub/swap_info.png');

		add(swapInfoText);
	}

	private function rtgInfo():Void
	{
		//trace('rtgInfo');

		rtgInfoText = new FlxSprite(290, 20);
		rtgInfoText.loadGraphic('assets/images/hub/rtg_info.png');

		add(rtgInfoText);
	}

	private function rexInfo():Void
	{
		//trace('rexInfo');

		rexInfoText = new FlxSprite(290, 20);
		rexInfoText.loadGraphic('assets/images/hub/rex_info.png');

		add(rexInfoText);
	}

	private function heatInfo():Void
	{
		//trace('heatInfo');

		heatInfoText = new FlxSprite(290, 20);
		heatInfoText.loadGraphic('assets/images/hub/heat_info.png');

		add(heatInfoText);
	}

	private function loadPad():Void
	{
		trace('loadPad');
		FlxG.switchState(new PadState());
	}
}