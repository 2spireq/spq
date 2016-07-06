package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxTimer;

class PauseState extends FlxSubState
{
	private var pauseBack:FlxSprite;
	private var exitWarning:FlxSprite;

	private var playButton:FlxButton;
	private var exitButton:FlxButton;
	private var exitButtonOk:FlxButton;
	private var exitButtonCancel:FlxButton;
	private var restartButton:FlxButton;

	private var cameraWidth:Int;
	private var cameraHeight:Int;

	override public function create():Void
	{
		cameraWidth = FlxG.camera.width;
		cameraHeight = FlxG.camera.height;

		pauseBack = new FlxSprite(cameraWidth - 640, cameraHeight - 480);
		if (Registry.minigamePaused == 'swap' || Registry.minigamePaused == 'swap2' || Registry.minigamePaused == 'swap3' || Registry.minigamePaused == 'swap4' || Registry.minigamePaused == 'swap5')
			pauseBack.loadGraphic('assets/images/pause/pause_back_swap.png');
		else
			pauseBack.loadGraphic('assets/images/pause/pause_back.png');
		pauseBack.scrollFactor.x = 0;
		pauseBack.scrollFactor.y = 0;
		add(pauseBack);

		exitWarning = new FlxSprite(160, 120);
		exitWarning.loadGraphic('assets/images/pause/e_warning.png');
		exitWarning.scrollFactor.x = 0;
		exitWarning.scrollFactor.y = 0;

		playButton = new FlxButton(260, 100, close);
		playButton.loadGraphic('assets/images/pause/button_play.png', false, 121, 32);
		playButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(playButton);

		exitButton = new FlxButton(260, 150, exit);
		exitButton.loadGraphic('assets/images/pause/button_exit.png', false, 121, 32);
		exitButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(exitButton);

		exitButtonOk = new FlxButton(174, 300, '', loadMenu);
		exitButtonOk.loadGraphic('assets/images/menu/d_warn_ok.png', false, 126, 32);
		exitButtonOk.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');

		exitButtonCancel = new FlxButton(340, 300, '', close);
		exitButtonCancel.loadGraphic('assets/images/menu/d_warn_cancel.png', false, 126, 32);
		exitButtonCancel.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');

		restartButton = new FlxButton(260, 200, restart);
		restartButton.loadGraphic('assets/images/pause/button_restart.png', false, 121, 32);
		restartButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(restartButton);

		if (Registry.minigamePaused == 'rtg')
			RtgRunState.timer.active = false;
		else if (Registry.minigamePaused == 'swap')
			SwapCraftState.timer.active = false;
		else if (Registry.minigamePaused == 'swap2')
			SwapCraftState2.timer.active = false;
		else if (Registry.minigamePaused == 'swap3')
			SwapCraftState3.timer.active = false;
		else if (Registry.minigamePaused == 'swap4')
			SwapCraftState4.timer.active = false;
		else if (Registry.minigamePaused == 'swap5')
			SwapCraftState4.timer.active = false;
		else if (Registry.minigamePaused == 'ralph')
			RalphZeroState.timer.active = false;

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

	private function exit():Void
	{
		add(exitWarning);
		add(exitButtonOk);
		add(exitButtonCancel);
	}

	private function restart():Void
	{
		if (Registry.minigamePaused == 'rtg')
			FlxG.switchState(new RtgRunState());
		else if (Registry.minigamePaused == 'alice')
			FlxG.switchState(new AliceState());
		else if (Registry.minigamePaused == 'heat')
			FlxG.switchState(new HeatHackState());
		else if (Registry.minigamePaused == 'swap' || Registry.minigamePaused == 'swap2' || Registry.minigamePaused == 'swap3' || Registry.minigamePaused == 'swap4' || Registry.minigamePaused == 'swap5')
			FlxG.switchState(new SwapCraftState());
		else if (Registry.minigamePaused == 'ralph')
			FlxG.switchState(new RalphZeroState());
	}

	private function loadMenu():Void
	{
		FlxG.switchState(new PlayState());
	}

}