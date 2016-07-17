package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.FlxCamera;
import flixel.FlxObject;
import flixel.group.FlxTypedGroup;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import flixel.system.FlxSound;
import flixel.util.FlxSpriteUtil;
import flixel.effects.FlxFlicker;
import Std.int;

class RexJumpState extends FlxState
{
	private var pauseState:PauseState;
	private var pauseButton:FlxButton;

	private var map:FlxOgmoLoader;
	private var walls:FlxTilemap;
	private var player:RalphPlayer;
	private var background:FlxSprite;
	private var partGet:FlxSound;
	private var p0:Rex0;
	private var grpParts0:FlxTypedGroup<Rex0>;
	private var failContinueButton:FlxButton;
	private var failText:FlxSprite;

	public static var timer:FlxTimer;
	private var timeText:FlxText;
	private var timerLeft:String;
	private var timerLeftInt:Int;
	private var pointsText:FlxText;
	private var helicopterText:FlxText;
	private var rexPartsFound:Int = 0;

	override public function create():Void
	{
		Registry.ralphFailed = false;

		FlxG.camera.flash(0xff000000, 1, null, false);

		partGet = FlxG.sound.load('assets/sounds/rtgpickup.wav');

		helicopterText = new FlxText(140, 14, 100);
		helicopterText.text = 'GET TO HELICOPTER!';
		helicopterText.setFormat(8, FlxColor.YELLOW);
		helicopterText.scrollFactor.x = 0;
		helicopterText.scrollFactor.y = 0;

		timer = new FlxTimer().start(140, timeEnd, 1);

		timerLeftInt = Std.int(timer.timeLeft);
		timerLeft = 'TIME: ' + timerLeftInt;
		timeText = new FlxText(10, 40, 100);
		timeText.text = timerLeft;
		timeText.setFormat(8, FlxColor.WHITE);
		timeText.scrollFactor.x = 0;
		timeText.scrollFactor.y = 0;

		pointsText = new FlxText(10, 70, 100);
		pointsText.text = 'PARTS: ' + rexPartsFound + ' /7';
		pointsText.setFormat(8, FlxColor.WHITE);
		pointsText.scrollFactor.x = 0;
		pointsText.scrollFactor.y = 0;

		background = new FlxSprite(0, 0);
		background.loadGraphic('assets/images/rexjump/background.png');
		add(background);

		map = new FlxOgmoLoader('assets/data/tower.oel');
		walls = map.loadTilemap('assets/images/rexjump/rextiles.png', 16, 16, 'tiles');
		add(walls);

		grpParts0 = new FlxTypedGroup<Rex0>();
		add(grpParts0);

		walls.setTileProperties(0, FlxObject.NONE);

		player = new RalphPlayer(100, 910);
		map.loadEntities(placeEntities, 'entities');
		add(player);

		FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER, 1);

		pauseState = new PauseState();
		pauseButton = new FlxButton(10, 10, '', loadPause);
		pauseButton.loadGraphic('assets/images/pause/button_pause.png', false, 32, 32);
		add(pauseButton);

		add(timeText);
		add(pointsText);
		
		super.create();
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{	
		FlxG.collide(walls, player);
		FlxG.overlap(player, grpParts0, playerHitInteract);

		timerLeftInt = Std.int(timer.timeLeft);
		timerLeft = 'TIME: ' + timerLeftInt;
		timeText.text = timerLeft;

		pointsText.text = 'PARTS: ' + rexPartsFound + ' /7';

		timer.active = true;

		super.update();
	}	

	private function playerHitInteract(P:Player, H:Ralph0):Void
	{
		if (P.alive && P.exists && H.alive && H.exists)
		{
			H.kill();
			rexPartsFound++;
			partGet.play();

			if (rexPartsFound == 7)
				add(helicopterText);
		}
	}

	private function loadPause():Void
	{
		Registry.minigamePaused = 'rex';
		pauseState = new PauseState();
		openSubState(pauseState);
	}

	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get('x'));
		var y:Int = Std.parseInt(entityData.get('y'));
		if (entityName == 'player')
		{
			player.x = x;
			player.y = y;
		}
		else if (entityName == 'p0')
			grpParts0.add(new Rex0(x, y));
	}

	private function timeEnd(Timer:FlxTimer):Void
	{
		trace('rex time end');

		failText = new FlxSprite(0, 193);
		failText.loadGraphic('assets/images/ralphzero/ralph_fail_text.png');
		failText.scrollFactor.x = 0;
		failText.scrollFactor.y = 0;
		FlxFlicker.flicker(failText, 0.3, 0.03, true, false, null, null);
		FlxSpriteUtil.fadeIn(failText, 1, true, null);
		add(failText);

		failContinueButton = new FlxButton(196, 420, '', failedNextState);
		failContinueButton.loadGraphic('assets/images/ralphzero/fail_continue_button.png', false, 247, 53);
		failContinueButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(failContinueButton);

		Registry.rexFailed = true;
	}

	private function helicopterInteract(Tile:FlxObject, Object:FlxObject):Void
	{
		if (rexPartsFound == 7)
			FlxG.camera.fade(0xff000000, 1, nextState, false);
	}

	private function nextState():Void
	{
		FlxG.switchState(new RalphFoundState());
	}

	private function failedNextState():Void
	{
		FlxG.camera.fade(0xff000000, 2, false, false);
		FlxG.switchState(new PlayState());
	}
}