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
	private var above:FlxTilemap;
	private var player:RexPlayer;
	private var background:FlxSprite;
	private var partGet:FlxSound;
	private var hitGet:FlxSound;
	private var p0:Rex0;
	private var a0:RexAir;
	private var grpParts0:FlxTypedGroup<Rex0>;
	private var grpAir0:FlxTypedGroup<RexAir>;
	private var failContinueButton:FlxButton;
	private var failText:FlxSprite;
	private var healthBar:FlxSprite;

	public static var timer:FlxTimer;
	private var timeText:FlxText;
	private var timerLeft:String;
	private var timerLeftInt:Int;
	private var pointsText:FlxText;
	private var livesText:FlxText;
	private var helicopterText:FlxText;
	private var rexPartsFound:Int = 0;
	private var healthPoints:Int = 3;
	private var remainingLives:Int = 3;
	private var onSpike:Bool = false;
	private var helperBool:Bool = false;

	private var health3:Bool = true;
	private var health2:Bool = true;
	private var health1:Bool = true;
	private var health0:Bool = true;

	private var endFlash:Int = 0;

	private var healthCounter:Int = 0;

	override public function create():Void
	{
		health3 = true;
		health2 = true;
		health1 = true;
		health0 = true;

		Registry.rexFailed = false;

		FlxG.camera.flash(0xff000000, 1, null, false);

		FlxG.sound.play('assets/music/rex_main.ogg', 1, true, false);

		partGet = FlxG.sound.load('assets/sounds/rtgpickup.wav');
		hitGet = FlxG.sound.load('assets/sounds/hit.wav');

		helicopterText = new FlxText(5, 101, 100);
		helicopterText.text = 'GET TO HELICOPTER!';
		helicopterText.setFormat(8, FlxColor.YELLOW);
		helicopterText.scrollFactor.x = 0;
		helicopterText.scrollFactor.y = 0;

		timer = new FlxTimer().start(140, timeEnd, 1);

		timerLeftInt = Std.int(timer.timeLeft);
		timerLeft = 'TIME: ' + timerLeftInt;
		timeText = new FlxText(5, 45, 100);
		timeText.text = timerLeft;
		timeText.setFormat(8, FlxColor.WHITE);
		timeText.scrollFactor.x = 0;
		timeText.scrollFactor.y = 0;

		pointsText = new FlxText(5, 57, 100);
		pointsText.text = 'PARTS: ' + rexPartsFound + ' /1';
		pointsText.setFormat(8, FlxColor.WHITE);
		pointsText.scrollFactor.x = 0;
		pointsText.scrollFactor.y = 0;

		livesText = new FlxText(5, 69, 100);
		livesText.text = 'LIVES: ' + remainingLives + ' /1';
		livesText.setFormat(8, FlxColor.RED);
		livesText.scrollFactor.x = 0;
		livesText.scrollFactor.y = 0;

		healthBar = new FlxSprite(5, 81);
		healthBar.loadGraphic('assets/images/rexjump/health3.png');
		healthBar.scrollFactor.x = 0;
		healthBar.scrollFactor.y = 0;

		background = new FlxSprite(0, 0);
		background.loadGraphic('assets/images/rexjump/background.png');
		add(background);

		map = new FlxOgmoLoader('assets/data/tower.oel');

		walls = map.loadTilemap('assets/images/rexjump/rextiles.png', 16, 16, 'tiles');
		add(walls);
		walls.setTileProperties(0, FlxObject.NONE);
		walls.setTileProperties(4, FlxObject.NONE, spikeSet);
		//walls.setTileProperties(13, FlxObject.NONE, airInteract);
		walls.setTileProperties(13, FlxObject.NONE);
		walls.setTileProperties(61, FlxObject.NONE);
		walls.setTileProperties(62, FlxObject.NONE);
		walls.setTileProperties(63, FlxObject.NONE);
		walls.setTileProperties(66, FlxObject.NONE);
		walls.setTileProperties(67, FlxObject.NONE);
		walls.setTileProperties(68, FlxObject.NONE, helicopterInteract);
		walls.setTileProperties(69, FlxObject.NONE);
		walls.setTileProperties(70, FlxObject.NONE);
		walls.setTileProperties(82, FlxObject.NONE);
		walls.setTileProperties(83, FlxObject.NONE);
		walls.setTileProperties(84, FlxObject.NONE, helicopterInteract);
		walls.setTileProperties(85, FlxObject.NONE);
		walls.setTileProperties(86, FlxObject.NONE);

		grpParts0 = new FlxTypedGroup<Rex0>();
		add(grpParts0);

		grpAir0 = new FlxTypedGroup<RexAir>();
		add(grpAir0);

		player = new RexPlayer(100, 910);
		map.loadEntities(placeEntities, 'entities');
		add(player);

		above = map.loadTilemap('assets/images/rexjump/rextiles.png', 16, 16, 'above');
		add(above);
		above.setTileProperties(14, FlxObject.NONE);
		above.setTileProperties(28, FlxObject.NONE);
		above.setTileProperties(29, FlxObject.NONE);
		above.setTileProperties(30, FlxObject.NONE);
		above.setTileProperties(43, FlxObject.NONE);
		above.setTileProperties(44, FlxObject.NONE);
		above.setTileProperties(45, FlxObject.NONE);
		above.setTileProperties(68, FlxObject.NONE);
		above.setTileProperties(83, FlxObject.NONE);
		above.setTileProperties(98, FlxObject.NONE);

		FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER, 1);

		pauseState = new PauseState();
		pauseButton = new FlxButton(10, 10, '', loadPause);
		pauseButton.loadGraphic('assets/images/pause/button_pause.png', false, 32, 32);
		add(pauseButton);

		add(timeText);
		add(pointsText);
		//add(livesText);
		add(healthBar);

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
		FlxG.overlap(player, grpAir0, playerAirInteract);

		timerLeftInt = Std.int(timer.timeLeft);
		timerLeft = 'TIME: ' + timerLeftInt;
		timeText.text = timerLeft;

		pointsText.text = 'PARTS: ' + rexPartsFound + ' /1';

		//livesText.text = 'LIVES: ' + remainingLives + ' /1';

		if (remainingLives <= 0)
			livesText.text = 'LIVES: 0/1';

		//helperBool = false;

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

			if (rexPartsFound == 1)
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
		else if (entityName == 'rex0')
			grpParts0.add(new Rex0(x, y));
		else if (entityName == 'air')
			grpAir0.add(new RexAir(x, y));
	}

	private function timeEnd(Timer:FlxTimer):Void
	{
		trace('rex time end');

		failText = new FlxSprite(0, 193);
		failText.loadGraphic('assets/images/rexjump/rex_fail_text.png');
		failText.scrollFactor.x = 0;
		failText.scrollFactor.y = 0;
		FlxFlicker.flicker(failText, 0.3, 0.03, true, false, null, null);
		FlxSpriteUtil.fadeIn(failText, 1, true, null);
		add(failText);

		failContinueButton = new FlxButton(196, 420, '', failedNextState);
		failContinueButton.loadGraphic('assets/images/rexjump/fail_continue_button.png', false, 247, 53);
		failContinueButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(failContinueButton);

		Registry.rexFailed = true;
	}

	private function healthEnd():Void
	{
		//trace('rex time end');

		if (endFlash == 1)
			FlxG.camera.flash(FlxColor.RED, 1, null, false);

		failText = new FlxSprite(0, 193);
		failText.loadGraphic('assets/images/rexjump/lives_fail_text.png');
		failText.scrollFactor.x = 0;
		failText.scrollFactor.y = 0;
		FlxFlicker.flicker(failText, 0.3, 0.03, true, false, null, null);
		FlxSpriteUtil.fadeIn(failText, 1, true, null);
		add(failText);

		failContinueButton = new FlxButton(196, 420, '', failedNextState);
		failContinueButton.loadGraphic('assets/images/rexjump/fail_continue_button.png', false, 247, 53);
		failContinueButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
		add(failContinueButton);

		Registry.rexFailed = true;
	}

	private function helicopterInteract(Tile:FlxObject, Object:FlxObject):Void
	{
		if (rexPartsFound == 1)
			FlxG.camera.fade(0xff000000, 1, nextState, false);
	}

	private function spikeSet(Tile:FlxObject, Object:FlxObject):Void
	{
		//if (onSpike == false)
		spikeInteract();
			//onSpike = true;
			
		//spikeInteract();

		//if (helperBool == false)
		//{
		//	spikeInteract();
		//	helperBool = true;
		//}
	}

	//private function spikeInteract(Tile:FlxObject, Object:FlxObject):Void
	private function spikeInteract():Void
	{	
		//trace('spike interact');

		healthCounter++;

		//trace(healthCounter);
		if (FlxG.overlap(player, grpAir0, playerAirInteract) == false)
		{
			if (healthCounter == 1)
			{
				remainingLives -= 1;
				hitGet.play();
			}
		}
		//else if (healthCounter == 2)
		//	healthCounter = 0;

		updateHealth();

		//helperBool = true;

		//remainingLives -= 1;
		//healthEnd();
		//onSpike = true;
	}

	private function airInteract(Tile:FlxObject, Object:FlxObject):Void
	{
		//trace('air interact');

		//if (helperBool == false)
		healthCounter = 0;
		//onSpike = false;
		//helperBool = false;
	}

	private function playerAirInteract(P:Player, H:Ralph0):Void
	{
		//trace('air entity interact');

		healthCounter = 0;
	}

	private function updateHealth():Void
	{
		/*if (healthPoints == 3)
			healthBar.loadGraphic('assets/images/rexjump/health3.png');
		else if (healthPoints == 2)
			healthBar.loadGraphic('assets/images/rexjump/health2.png');
		else if (healthPoints == 1)
			healthBar.loadGraphic('assets/images/rexjump/health1.png');
		else if (healthPoints == 0)
			healthBar.loadGraphic('assets/images/rexjump/health0.png');
			healthEnd();*/

		/*/if (health3 == true && health2 == true && health1 == true)
			healthBar.loadGraphic('assets/images/rexjump/health3.png');
		else if (health2 == true && health1 == true && health3 == false)
			healthBar.loadGraphic('assets/images/rexjump/health2.png');
		else if (health1 == true && health2 == false && health3 == false)
			healthBar.loadGraphic('assets/images/rexjump/health1.png');
		else if (health1 == false && health2 == false && health3 == false)
			healthBar.loadGraphic('assets/images/rexjump/health0.png');
			healthEnd();*/

		if (remainingLives == 3)
			healthBar.loadGraphic('assets/images/rexjump/health3.png');
		else if (remainingLives == 2)
			healthBar.loadGraphic('assets/images/rexjump/health2.png');
		else if (remainingLives == 1)
			healthBar.loadGraphic('assets/images/rexjump/health1.png');
		else if (remainingLives <= 0)
		{
			healthBar.loadGraphic('assets/images/rexjump/health0.png');
			endFlash++;
			healthEnd();
		}

		//onSpike = false;
	}

	private function nextState():Void
	{
		FlxG.switchState(new RexFoundState());
	}

	private function failedNextState():Void
	{
		FlxG.camera.fade(0xff000000, 2, false, false);
		FlxG.switchState(new PlayState());
	}
}