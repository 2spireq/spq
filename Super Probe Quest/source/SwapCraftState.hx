package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;
import flixel.effects.FlxFlicker;

class SwapCraftState extends FlxState
{
	private var chosen:Bool;
	private var wrong:Bool;
	private var timedOut:Bool;

	private var back:FlxSprite;
	private var tray:FlxSprite;
	private var photo:FlxSprite;
	private var clock:FlxSprite;
	private var clockBack:FlxSprite;
	private var overlay:FlxSprite;

	private var forward_0:FlxButton;
	private var forward_1:FlxButton;
	private var forward_2:FlxButton;
	private var forward_3:FlxButton;

	private var previewImg0:FlxSprite;
	private var previewImg1:FlxSprite;
	private var previewImg2:FlxSprite;
	private var previewImg3:FlxSprite;

	private var timeOut:FlxSprite;
	private var continueButton:FlxButton;

	private var incorrect:FlxSprite;
	private var incorrectContinueButton:FlxButton;

	private var correct:FlxSprite;
	private var correctContinueButton:FlxButton;

	private var pauseState:PauseState;
	private var pauseButton:FlxButton;

	public static var timer:FlxTimer;
	private var timeText:FlxText;
	private var timerLeft:String;
	private var timerLeftInt:Int;

	private var clockX:Int;
	private var clockY:Int;

	private var trayX:Int;
	private var trayY:Int;

	private var previewX0:Int;
	private var previewY0:Int;

	override public function create():Void
	{
		FlxG.camera.flash(0xff000000, 1, null, false);

		chosen = false;
		wrong = false;

		clockX = 400;
		clockY = 420;

		trayX = 0;
		trayY = 416;

		previewX0 = 300;
		previewY0 = 250;
		
		timer = new FlxTimer().start(9, timeEnd, 1);

		timerLeftInt = Std.int(timer.timeLeft);
		timerLeft = 'TIME: ' + timerLeftInt;
		timeText = new FlxText(clockX + 2, clockY + 18, 100);
		timeText.text = timerLeft;
		timeText.setFormat(16, FlxColor.RED);

		back = new FlxSprite(0, 0);
		back.loadGraphic('assets/images/swapcraft/swap_back.png');
		add(back);

		overlay = new FlxSprite(0, 0);
		overlay.loadGraphic('assets/images/swapcraft/swap_tutorial_overlay.png');
		add(overlay);

		tray = new FlxSprite(trayX, trayY);
		tray.loadGraphic('assets/images/swapcraft/tray.png');
		add(tray);

		clockBack = new FlxSprite(257, trayY);
		clockBack.loadGraphic('assets/images/swapcraft/clock_back.png');
		add(clockBack);

		photo = new FlxSprite(150, 20);
		photo.loadGraphic('assets/images/swapcraft/comp_swap.png');
		photo.angle = -7;
		add(photo);

		clock = new FlxSprite(clockX, clockY);
		clock.loadGraphic('assets/images/swapcraft/clock.png');
		add(clock);

		timeOut = new FlxSprite(155, 223);
		timeOut.loadGraphic('assets/images/swapcraft/swaptimeout.png');

		incorrect = new FlxSprite(155, 223);
		incorrect.loadGraphic('assets/images/swapcraft/swapincorrect.png');

		correct = new FlxSprite(155, 223);
		correct.loadGraphic('assets/images/swapcraft/swapcorrect.png');

		continueButton = new FlxButton(253, 300, '', failState);
		continueButton.loadGraphic('assets/images/misc/button_continue.png', false, 134, 39);

		incorrectContinueButton = new FlxButton(253, 300, '', failState);
		incorrectContinueButton.loadGraphic('assets/images/misc/button_continue.png', false, 134, 39);

		correctContinueButton = new FlxButton(253, 300, '', nextState);
		correctContinueButton.loadGraphic('assets/images/misc/button_continue.png', false, 134, 39);

		forward_0 = new FlxButton(trayX, trayY, '', f0);
		forward_0.loadGraphic('assets/images/swapcraft/parts/forward_0.png', false, 64, 64);
		add(forward_0);

		forward_1 = new FlxButton(trayX + 64, trayY, '', f1);
		forward_1.loadGraphic('assets/images/swapcraft/parts/forward_1.png', false, 64, 64);
		add(forward_1);

		forward_2 = new FlxButton(trayX + 128, trayY, '', f2);
		forward_2.loadGraphic('assets/images/swapcraft/parts/forward_2.png', false, 64, 64);
		add(forward_2);

		forward_3 = new FlxButton(trayX + 192, trayY, '', f3);
		forward_3.loadGraphic('assets/images/swapcraft/parts/forward_3.png', false, 64, 64);
		add(forward_3);

		pauseState = new PauseState();
		pauseButton = new FlxButton(10, 10, '', loadPause);
		pauseButton.loadGraphic('assets/images/pause/button_pause.png', false, 32, 32);
		add(pauseButton);

		add(timeText);

		super.create();
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{		
		timerLeftInt = Std.int(timer.timeLeft);
		timerLeft = 'TIME: ' + timerLeftInt;
		timeText.text = timerLeft;

		if (chosen != true)
		{
				forward_0.onOver.callback = preview0;
				forward_0.onOut.callback = remove0;

				forward_1.onOver.callback = preview1;
				forward_1.onOut.callback = remove1;

				forward_2.onOver.callback = preview2;
				forward_2.onOut.callback = remove2;

				forward_3.onOver.callback = preview3;
				forward_3.onOut.callback = remove3;
		}
		else
		{
				forward_0.onOver.callback = previewFiller;
				forward_0.onOut.callback = previewFiller;

				forward_1.onOver.callback = previewFiller;
				forward_1.onOut.callback = previewFiller;

				forward_2.onOver.callback = previewFiller;
				forward_2.onOut.callback = previewFiller;

				forward_3.onOver.callback = previewFiller;
				forward_3.onOut.callback = previewFiller;
		}

		timer.active = true;

		super.update();
	}	

	private function f0():Void
	{
		if (chosen != true)
		{
			chosen = true;
			wrong = true;
			incorrectEnd();
			trace('f0');
		}
	}

	private function f1():Void
	{
		if (chosen != true)
		{
			chosen = true;
			wrong = true;
			incorrectEnd();
			trace('f1');
		}
	}

	private function f2():Void
	{
		if (chosen != true)
		{
			previewImg2.alpha = 1;
			chosen = true;
			trace('f2');
			correctChosen();
		}
	}

	private function f3():Void
	{
		if (chosen != true)
		{
			chosen = true;
			wrong = true;
			incorrectEnd();
			trace('f3');
		}
	}

	private function previewFiller():Void
	{

	}

	private function preview0():Void
	{
		previewImg0 = new FlxSprite(previewX0, previewY0);
		previewImg0.loadGraphic('assets/images/swapcraft/partsoriginals/forward_0_original.png');
		previewImg0.alpha = 0.65;
		add(previewImg0);
	}

	private function preview1():Void
	{
		previewImg1 = new FlxSprite(previewX0, previewY0);
		previewImg1.loadGraphic('assets/images/swapcraft/partsoriginals/forward_1_original.png');
		previewImg1.alpha = 0.65;
		add(previewImg1);
	}

	private function preview2():Void
	{
		previewImg2 = new FlxSprite(previewX0, previewY0);
		previewImg2.loadGraphic('assets/images/swapcraft/partsoriginals/forward_2_original.png');
		previewImg2.alpha = 0.65;
		add(previewImg2);
	}

	private function preview3():Void
	{
		previewImg3 = new FlxSprite(previewX0, previewY0);
		previewImg3.loadGraphic('assets/images/swapcraft/partsoriginals/forward_3_original.png');
		previewImg3.alpha = 0.65;
		add(previewImg3);
	}

	private function remove0():Void
	{
		previewImg0.kill();
	}

	private function remove1():Void
	{
		previewImg1.kill();
	}

	private function remove2():Void
	{
		previewImg2.kill();
	}

	private function remove3():Void
	{
		previewImg3.kill();
	}

	private function timeEnd(Timer:FlxTimer):Void
	{
		timedOut = true;

		if (wrong != true)
		{
			trace('swap out of time');

			FlxFlicker.flicker(timeOut, 0.3, 0.03, true, false, null, null);
			FlxSpriteUtil.fadeIn(timeOut, 1, true, null);
			add(timeOut);
			add(continueButton);
		}
	}

	private function incorrectEnd():Void
	{
		if (timedOut != true)
		{
			trace('swap incorrect');

			FlxFlicker.flicker(incorrect, 0.3, 0.03, true, false, null, null);
			FlxSpriteUtil.fadeIn(incorrect, 1, true, null);
			add(incorrect);
			add(incorrectContinueButton);
		}
	}

	private function correctChosen():Void
	{
		trace('swap correct');

		FlxFlicker.flicker(correct, 0.3, 0.03, true, false, null, null);
		FlxSpriteUtil.fadeIn(correct, 1, true, null);
		add(correct);
		add(correctContinueButton);
	}

	private function loadPause():Void
	{
		Registry.minigamePaused = 'swap';
		pauseState = new PauseState();
		openSubState(pauseState);
	}

	private function failState():Void
	{
		trace('swap fail');

		FlxG.camera.fade(0xff000000, 2, false, false);
		FlxG.switchState(new SwapIntroState2());
	}

	private function nextState():Void
	{
		trace('swap next');

		FlxG.switchState(new SwapCraftState2());
	}
}