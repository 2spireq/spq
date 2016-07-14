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
	private var aliceButton:FlxButton;
	//private var lorriButton:FlxButton;
	//private var pepssiButton:FlxButton;
	private var ralphButton:FlxButton;
	private var swapButton:FlxButton;
	private var rtgButton:FlxButton;
	private var rexButton:FlxButton;
	private var heatButton:FlxButton;

	private var aliceInfoText:FlxSprite;
	//private var lorriInfoText:FlxSprite;
	//private var pepssiInfoText:FlxSprite;
	private var ralphInfoText:FlxSprite;
	private var swapInfoText:FlxSprite;
	private var rtgInfoText:FlxSprite;
	private var rexInfoText:FlxSprite;
	private var heatInfoText:FlxSprite;
	private var blockout:FlxSprite;

	private var padButton:FlxButton;
	private var menuButton:FlxButton;

	private var starBack:FlxSprite;
	private var overlay:FlxSprite;

	private var hubPauseState:HubPauseState;

	private var startX:Int = 204;
	private var startY:Int = 100;

	private var infoX:Int = 143;
	private var infoY:Int = 320;

	override public function create():Void
	{
		FlxG.sound.play('assets/music/hub_main.ogg', 1, true, false);

		starBack = new FlxSprite(0, 0);
		starBack.loadGraphic('assets/images/hub/starback_2.png');
		add(starBack);

		overlay = new FlxSprite(0, 0);
		overlay.loadGraphic('assets/images/hub/hub_overlay.png');
		add(overlay);

		/*
		aliceButton = new FlxButton(startX, startY, '', fadeAlice);
		lorriButton = new FlxButton(startX + 66, startY, '', fadeLorri);
		pepssiButton = new FlxButton(startX + 132, startY, '', fadePepssi);
		ralphButton = new FlxButton(startX + 198, startY, '', fadeRalph);
		swapButton = new FlxButton(startX, startY + 66, '', fadeSwap);
		rtgButton = new FlxButton(startX + 66, startY + 66, '', fadeRtg);
		rexButton = new FlxButton(startX + 132, startY + 66, '', fadeRex);
		heatButton = new FlxButton(startX + 198, startY + 66, '', fadeHeat);
		*/

		aliceButton = new FlxButton(startX, startY, '', fadeAlice);
		ralphButton = new FlxButton(startX + 84, startY, '', fadeRalph);
		swapButton = new FlxButton(startX + 168, startY, '', fadeSwap);
		rtgButton = new FlxButton(startX, startY + 84, '', fadeRtg);
		rexButton = new FlxButton(startX + 84, startY + 84, '', fadeRex);
		heatButton = new FlxButton(startX + 168, startY + 84, '', fadeHeat);

		trace(Registry.partsNo);

		if (Registry.partsNo == 6)
			Registry.launchReady = true;

		if (Registry.haveAlice == true)
		{
			aliceButton.loadGraphic('assets/images/component/buttonsprites/comp_alice_d.png', false, 64, 64);
			trace('ALICE TRUE');
		}
		else if (Registry.haveAlice == false)
		{
			aliceButton.loadGraphic('assets/images/component/buttonsprites/comp_alice_alt.png', false, 64, 64);
			trace('ALICE FALSE');
		}

		/*if (Registry.haveLorri == true)
		{
			lorriButton.loadGraphic('assets/images/component/buttonsprites/comp_lorri_d.png', false, 64, 64);
			trace('LORRI TRUE');
		}
		else if (Registry.haveLorri == false)
		{
			lorriButton.loadGraphic('assets/images/component/buttonsprites/comp_lorri_alt.png', false, 64, 64);
			trace('LORRI FALSE');
		}*/

		/*if (Registry.havePepssi == true)
		{
			pepssiButton.loadGraphic('assets/images/component/buttonsprites/comp_pepssi_d.png', false, 64, 64);
			trace('PEPSSI TRUE');
		}
		else if (Registry.havePepssi == false)
		{
			pepssiButton.loadGraphic('assets/images/component/buttonsprites/comp_pepssi_alt.png', false, 64, 64);
			trace('PEPSSI FALSE');
		}*/

		if (Registry.haveRalph == true)
		{
			ralphButton.loadGraphic('assets/images/component/buttonsprites/comp_ralph_d.png', false, 64, 64);
			trace('RALPH TRUE');
		}
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
		else if (Registry.haveHeat == false)
		{
			heatButton.loadGraphic('assets/images/component/buttonsprites/comp_heat_alt.png', false, 64, 64);
			trace('HEAT FALSE');
		}

		aliceButton.onOver.callback = aliceInfo;
		aliceButton.onOut.callback = infoRemove;
		aliceButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(aliceButton);

		/*lorriButton.onOver.callback = lorriInfo;
		lorriButton.onOut.callback = infoRemove;
		lorriButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(lorriButton);*/

		/*pepssiButton.onOver.callback = pepssiInfo;
		pepssiButton.onOut.callback = infoRemove;
		pepssiButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(pepssiButton);*/

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

		blockout = new FlxSprite(infoX, infoY - 2);
		blockout.loadGraphic('assets/images/hub/blockout.png');
		add(blockout);

		padButton = new FlxButton(54, 10, '', fadePad);
		padButton.loadGraphic('assets/images/menu/button_pad.png', 131, 32);
		padButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(padButton);

		menuButton = new FlxButton(10, 10, '', loadPause);
		menuButton.loadGraphic('assets/images/pause/button_pause.png', 32, 32);
		menuButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(menuButton);

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

	private function fadeAlice():Void
	{
		FlxG.camera.fade(0xffffffff, 1, loadAlice, false);
	}

	/*private function fadeLorri():Void
	{
		FlxG.camera.fade(0xffffffff, 1, loadLorri, false);
	}*/

	/*private function fadePepssi():Void
	{
		FlxG.camera.fade(0xffffffff, 1, loadPepssi, false);
	}*/

	private function fadeRalph():Void
	{
		FlxG.camera.fade(0xffffffff, 1, loadRalph, false);
	}

	private function fadeSwap():Void
	{
		FlxG.camera.fade(0xffffffff, 1, loadSwap, false);
	}

	private function fadeRtg():Void
	{
		FlxG.camera.fade(0xffffffff, 1, loadRtg, false);
	}

	private function fadeRex():Void
	{
		FlxG.camera.fade(0xffffffff, 1, loadRex, false);
	}

	private function fadeHeat():Void
	{
		FlxG.camera.fade(0xffffffff, 1, loadHeat, false);
	}

	private function fadePad():Void
	{
		FlxG.camera.fade(0xffffffff, 1, loadPad, false);
	}

	private function loadAlice():Void
	{
		trace('loadAlice');
		FlxG.switchState(new AliceTitleState());
	}

	/*private function loadLorri():Void
	{
		trace('loadLorri');
		//FlxG.switchState(new PlayState());
	}*/

	/*private function loadPepssi():Void
	{
		trace('loadPepssi');
		FlxG.switchState(new PepssiDialogState0());
	}*/

	private function loadRalph():Void
	{
		trace('loadRalph');
		FlxG.switchState(new RalphZeroState());
	}

	private function loadSwap():Void
	{
		trace('loadSwap');
		FlxG.switchState(new SwapIntroState());
	}

	private function loadRtg():Void
	{
		trace('loadRtg');
		FlxG.switchState(new RtgIntroState());
	}

	private function loadRex():Void
	{
		trace('loadRex');
		//FlxG.switchState(new PlayState());
	}

	private function loadHeat():Void
	{
		trace('loadHeat');
		FlxG.switchState(new HeatIntroState());
	}

	private function infoRemove():Void
	{
		//trace('infoRemove');

		blockout = new FlxSprite(infoX, infoY - 2);
		blockout.loadGraphic('assets/images/hub/blockout.png');

		add(blockout);
	}

	private function aliceInfo():Void
	{
		//trace('aliceInfo');

		aliceInfoText = new FlxSprite(infoX, infoY);
		aliceInfoText.loadGraphic('assets/images/hub/alice_info.png');

		add(aliceInfoText);
	}

	/*private function lorriInfo():Void
	{
		//trace('lorriInfo');

		lorriInfoText = new FlxSprite(infoX, infoY);
		lorriInfoText.loadGraphic('assets/images/hub/lorri_info.png');

		add(lorriInfoText);
	}*/

	/*private function pepssiInfo():Void
	{
		//trace('pepssiInfo');

		pepssiInfoText = new FlxSprite(infoX, infoY);
		pepssiInfoText.loadGraphic('assets/images/hub/pepssi_info.png');

		add(pepssiInfoText);
	}*/

	private function ralphInfo():Void
	{
		//trace('ralphInfo');

		ralphInfoText = new FlxSprite(infoX, infoY);
		ralphInfoText.loadGraphic('assets/images/hub/ralph_info.png');

		add(ralphInfoText);
	}

	private function swapInfo():Void
	{
		//trace('swapInfo');

		swapInfoText = new FlxSprite(infoX, infoY);
		swapInfoText.loadGraphic('assets/images/hub/swap_info.png');

		add(swapInfoText);
	}

	private function rtgInfo():Void
	{
		//trace('rtgInfo');

		rtgInfoText = new FlxSprite(infoX, infoY);
		rtgInfoText.loadGraphic('assets/images/hub/rtg_info.png');

		add(rtgInfoText);
	}

	private function rexInfo():Void
	{
		//trace('rexInfo');

		rexInfoText = new FlxSprite(infoX, infoY);
		rexInfoText.loadGraphic('assets/images/hub/rex_info.png');

		add(rexInfoText);
	}

	private function heatInfo():Void
	{
		//trace('heatInfo');

		heatInfoText = new FlxSprite(infoX, infoY);
		heatInfoText.loadGraphic('assets/images/hub/heat_info.png');

		add(heatInfoText);
	}

	private function loadPad():Void
	{
		trace('loadPad');
		FlxG.switchState(new PadState());
	}

	private function loadPause():Void
	{
		hubPauseState = new HubPauseState();
		openSubState(hubPauseState);
	}
}