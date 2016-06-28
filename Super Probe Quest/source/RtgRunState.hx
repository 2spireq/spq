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
import flixel.util.FlxSpriteUtil;
import flixel.effects.FlxFlicker;
import flixel.tweens.FlxTween;
import Std.int;

class RtgRunState extends FlxState
{
	private var sky:FlxSprite;
	private var background:FlxSprite;
	private var clouds:FlxSprite;
	private var sun:FlxSprite;
	private var failText:FlxSprite;
	private var pauseState:PauseState;
	private var pauseButton:FlxButton;
	private var failContinueButton:FlxButton;
	private var timer:FlxTimer;
	private var timeText:FlxText;
	private var timerLeft:String;
	private var timerLeftInt:Int;
	private var pointsText:FlxText;
	private var rtgPartsFound:Int = 0;

	private var map:FlxOgmoLoader;
	private var walls:FlxTilemap;
	private var player:RtgPlayer;
	private var p0:Rtg0;
	private var grpParts0:FlxTypedGroup<Rtg0>;

	override public function create():Void
	{
		Registry.rtgInWater = false;
		Registry.rtgOnLadder = false;
		Registry.rtgFailed = false;

		FlxG.camera.flash(0xff000000, 1, null, false);

		//timer = new FlxTimer().start(100, timeEnd, 1);
		timer = new FlxTimer().start(10, timeEnd, 1);

		timerLeftInt = Std.int(timer.timeLeft);
		timerLeft = 'TIME: ' + timerLeftInt;
		timeText = new FlxText(60, 14, 100);
		timeText.text = timerLeft;
		timeText.setFormat(8, FlxColor.WHITE);
		timeText.scrollFactor.x = 0;

		pointsText = new FlxText(60, 24, 100);
		pointsText.text = 'PARTS: ' + rtgPartsFound + ' /4';
		pointsText.setFormat(8, FlxColor.WHITE);
		pointsText.scrollFactor.x = 0;

		sky = new FlxSprite(0, 0);
		sky.loadGraphic('assets/images/rtgrun/sky.png');
		add(sky);

		clouds = new FlxSprite(0, 0);
		clouds.loadGraphic('assets/images/rtgrun/clouds.png');
		add(clouds);
		clouds.scrollFactor.x = 0;

		sun = new FlxSprite(500, 20);
		sun.loadGraphic('assets/images/rtgrun/sun.png');
		add(sun);
		sun.scrollFactor.x = 0;

		background = new FlxSprite(0, 0);
		background.loadGraphic('assets/images/rtgrun/background.png');
		background.scrollFactor.x = 0.2;
		add(background);

		map = new FlxOgmoLoader('assets/data/plats.oel');
		walls = map.loadTilemap('assets/images/rtgrun/placeholder.png', 16, 16, 'walls');
		add(walls);

		grpParts0 = new FlxTypedGroup<Rtg0>();
		add(grpParts0);

		player = new RtgPlayer(20, 200);
		map.loadEntities(placeEntities, 'entities');
		add(player);

		walls.setTileProperties(0, FlxObject.NONE);
		walls.setTileProperties(1, FlxObject.NONE);
		walls.setTileProperties(2, FlxObject.NONE);
		walls.setTileProperties(3, FlxObject.NONE);
		walls.setTileProperties(4, FlxObject.NONE);
		walls.setTileProperties(14, FlxObject.NONE);
		walls.setTileProperties(16, FlxObject.NONE);
		walls.setTileProperties(17, FlxObject.NONE, waterOverlap);
		walls.setTileProperties(18, FlxObject.NONE);
		walls.setTileProperties(26, FlxObject.NONE, airOverlap);
		walls.setTileProperties(40, FlxObject.NONE, ladderOverlap);
		walls.setTileProperties(41, FlxObject.NONE, ladderOverlap);
		walls.setTileProperties(42, FlxObject.NONE, airOverlap);
		walls.setTileProperties(52, FlxObject.NONE);
		walls.setTileProperties(53, FlxObject.NONE); // green clothesline
		walls.setTileProperties(56, FlxObject.NONE, waterOverlap);
		walls.setTileProperties(64, FlxObject.NONE);
		walls.setTileProperties(65, FlxObject.NONE);
		walls.setTileProperties(69, FlxObject.NONE, airOverlap);
		walls.setTileProperties(70, FlxObject.NONE, airOverlap);
		walls.setTileProperties(88, FlxObject.NONE);
		walls.setTileProperties(89, FlxObject.NONE);
		walls.setTileProperties(90, FlxObject.NONE);
		walls.setTileProperties(91, FlxObject.NONE);
		walls.setTileProperties(92, FlxObject.NONE);
		walls.setTileProperties(104, FlxObject.NONE);
		walls.setTileProperties(105, FlxObject.NONE, helicopterInteract);
		walls.setTileProperties(106, FlxObject.NONE, helicopterInteract);
		walls.setTileProperties(107, FlxObject.NONE);
		walls.setTileProperties(108, FlxObject.NONE);

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
		timerLeftInt = Std.int(timer.timeLeft);
		timerLeft = 'TIME: ' + timerLeftInt;
		timeText.text = timerLeft;

		pointsText.text = 'PARTS: ' + rtgPartsFound + ' /4';

		FlxG.collide(walls, player);
		FlxG.overlap(player, grpParts0, playerHitInteract);

		/*if (FlxG.keys.justPressed.ESCAPE)
			loadPause();*/

		super.update();
	}	

	private function playerHitInteract(P:Player, H:Rtg0):Void
	{
		if (P.alive && P.exists && H.alive && H.exists)
		{
			H.kill();
			rtgPartsFound++;
		}
		trace('rtg part +');
	}

	private function hitInteract0():Void
	{
		rtgPartsFound++;
	}

	private function loadMenu():Void
	{
		FlxG.switchState(new PlayState());
	}

	private function loadPause():Void
	{
		Registry.minigamePaused = 'rtg';
		pauseState = new PauseState();
		openSubState(pauseState);
	}

	private function waterOverlap(Tile:FlxObject, Object:FlxObject):Void
	{
		Registry.rtgInWater = true;
	}

	private function airOverlap(Tile:FlxObject, Object:FlxObject):Void
	{
		Registry.rtgInWater = false;
		Registry.rtgOnLadder = false;
	}

	private function helicopterInteract(Tile:FlxObject, Object:FlxObject):Void
	{
		if (rtgPartsFound == 4)
			FlxG.camera.fade(0xff000000, 1, nextState, false);
	}

	private function ladderOverlap(Tile:FlxObject, Object:FlxObject):Void
	{
		Registry.rtgOnLadder = true;
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
			grpParts0.add(new Rtg0(x, y));
	}

	private function timeEnd(Timer:FlxTimer):Void
	{
		trace('rtg time end');

		failText = new FlxSprite(0, 193);
		failText.loadGraphic('assets/images/rtgrun/rtg_fail_text.png');
		failText.scrollFactor.x = 0;
		failText.scrollFactor.y = 0;
		FlxFlicker.flicker(failText, 0.3, 0.03, true, false, null, null);
		FlxSpriteUtil.fadeIn(failText, 1, true, null);
		add(failText);

		failContinueButton = new FlxButton(196, 420, '', failedNextState);
		failContinueButton.loadGraphic('assets/images/rtgrun/fail_continue_button.png', false, 247, 53);
		failContinueButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(failContinueButton);

		Registry.rtgFailed = true;
	}

	private function nextState():Void
	{
		FlxG.switchState(new RtgFoundState());
	}

	private function failedNextState():Void
	{
		FlxG.camera.fade(0xff000000, 2, false, false);
		FlxG.switchState(new PlayState());
	}
}