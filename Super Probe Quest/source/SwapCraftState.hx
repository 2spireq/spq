package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class SwapCraftState extends FlxState
{
	private var back:FlxSprite;
	private var tray:FlxSprite;
	private var photo:FlxSprite;
	private var clock:FlxSprite;

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

	private var pauseState:PauseState;
	private var pauseButton:FlxButton;

	private var timer:FlxTimer;
	private var timeText:FlxText;
	private var timerLeft:String;
	private var timerLeftInt:Int;

	private var clockX:Int;
	private var clockY:Int;

	private var trayX:Int;
	private var trayY:Int;

	override public function create():Void
	{
		FlxG.camera.flash(0xff000000, 1, null, false);

		clockX = 400;
		clockY = 430;

		trayX = 0;
		trayY = 416;
		
		timer = new FlxTimer().start(9, timeEnd, 1);

		timerLeftInt = Std.int(timer.timeLeft);
		timerLeft = 'TIME: ' + timerLeftInt;
		timeText = new FlxText(clockX + 2, clockY + 18, 100);
		timeText.text = timerLeft;
		timeText.setFormat(16, FlxColor.RED);

		back = new FlxSprite(0, 0);
		back.loadGraphic('assets/images/swapcraft/swap_back.png');
		add(back);

		tray = new FlxSprite(trayX, trayY);
		tray.loadGraphic('assets/images/swapcraft/tray.png');
		add(tray);

		photo = new FlxSprite(100, 100);
		photo.loadGraphic('assets/images/swapcraft/comp_swap.png');
		photo.angle = -10;
		add(photo);

		clock = new FlxSprite(clockX, clockY);
		clock.loadGraphic('assets/images/swapcraft/clock.png');
		add(clock);

		timeOut = new FlxSprite(155, 223);
		timeOut.loadGraphic('assets/images/swapcraft/swaptimeout.png');

		continueButton = new FlxButton(253, 300, '', failState);
		continueButton.loadGraphic('assets/images/misc/button_continue.png', false, 134, 39);

		forward_0 = new FlxButton(trayX, trayY, '', f0);
		forward_0.loadGraphic('assets/images/swapcraft/parts/forward_0.png', false, 64, 64);
		forward_0.onOver.callback = preview0;
		forward_0.onOut.callback = remove0;
		add(forward_0);

		forward_1 = new FlxButton(trayX + 64, trayY, '', f1);
		forward_1.loadGraphic('assets/images/swapcraft/parts/forward_1.png', false, 64, 64);
		forward_1.onOver.callback = preview1;
		forward_1.onOut.callback = remove1;
		add(forward_1);

		forward_2 = new FlxButton(trayX + 128, trayY, '', f2);
		forward_2.loadGraphic('assets/images/swapcraft/parts/forward_2.png', false, 64, 64);
		forward_2.onOver.callback = preview2;
		forward_2.onOut.callback = remove2;
		add(forward_2);

		forward_3 = new FlxButton(trayX + 192, trayY, '', f3);
		forward_3.loadGraphic('assets/images/swapcraft/parts/forward_3.png', false, 64, 64);
		forward_3.onOver.callback = preview3;
		forward_3.onOut.callback = remove3;
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

		super.update();
	}	

	private function f0():Void
	{
		trace('f0');
	}

	private function f1():Void
	{
		trace('f1');
	}

	private function f2():Void
	{
		trace('f2');
	}

	private function f3():Void
	{
		trace('f3');
	}

	private function preview0():Void
	{
		previewImg0 = new FlxSprite(200, 200);
		previewImg0.loadGraphic('assets/images/swapcraft/partsoriginals/forward_0_original.png');
		previewImg0.alpha = 0.65;
		add(previewImg0);
	}

	private function preview1():Void
	{
		previewImg1 = new FlxSprite(200, 200);
		previewImg1.loadGraphic('assets/images/swapcraft/partsoriginals/forward_1_original.png');
		previewImg1.alpha = 0.65;
		add(previewImg1);
	}

	private function preview2():Void
	{
		previewImg2 = new FlxSprite(200, 200);
		previewImg2.loadGraphic('assets/images/swapcraft/partsoriginals/forward_2_original.png');
		previewImg2.alpha = 0.65;
		add(previewImg2);
	}

	private function preview3():Void
	{
		previewImg3 = new FlxSprite(200, 200);
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
		trace('swap out of time');

		add(timeOut);
		add(continueButton);
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
		FlxG.switchState(new PlayState());
	}
}