package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.FlxCamera;
import flixel.FlxObject;
import flixel.group.FlxTypedGroup;
import flixel.ui.FlxButton;

class AliceState extends FlxState
{
	private var player:Player;
	private var map:FlxOgmoLoader;
	private var walls:FlxTilemap;
	private var grpHit:FlxTypedGroup<Alice_Hit>;
	private var overlay:FlxSprite;

	private var pauseState:PauseState;
	private var pauseButton:FlxButton;

	override public function create():Void
	{
		FlxG.camera.flash(0xff000000, 1, null, false);

		FlxG.sound.play('assets/music/rex_main.ogg', 1, true, false);
		
		map = new FlxOgmoLoader('assets/data/maze.oel');
		walls = map.loadTilemap('assets/images/alicemaze/b-map.png', 16, 16, 'walls');
		walls.setTileProperties(1, FlxObject.ANY);
		walls.setTileProperties(2, FlxObject.NONE);
		walls.setTileProperties(44, FlxObject.NONE);
		walls.setTileProperties(45, FlxObject.NONE);
		add(walls);

		grpHit = new FlxTypedGroup<Alice_Hit>();
 
		player = new Player();
	
		map.loadEntities(placeEntities, 'entities');
		add(player);
		add(grpHit);

		FlxG.camera.follow(player, FlxCamera.STYLE_TOPDOWN, 1);

		overlay = new FlxSprite(player.x - 636, player.y - 476);
		overlay.loadGraphic('assets/images/alicemaze/overlay.png');
		add(overlay);

		pauseState = new PauseState();
		pauseButton = new FlxButton(10, 10, '', loadPause);
		pauseButton.loadGraphic('assets/images/pause/button_pause.png', false, 32, 32);
		add(pauseButton);

		super.create();
	}

	private function hitInteract():Void
	{
		trace('alice get');
		FlxG.camera.fade(0xff000000, 1, nextState, false);
	}

	private function playerCleanerInteract(P:Player, C:Cleaner):Void
	{
		if (P.alive && P.exists && C.alive && C.exists)
			C.kill();
			
		trace('cleaner interact');
	}

	private function playerHitInteract(P:Player, H:Alice_Hit):Void
	{
		if (P.alive && P.exists && H.alive && H.exists)
		{
			H.kill();
			hitInteract();
		}
		trace('hit interact');
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();

		FlxG.collide(player, walls);
		FlxG.overlap(player, grpHit, playerHitInteract);

		overlay.x = player.x - 636;
		overlay.y = player.y - 476;
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
		else if (entityName == 'alice_hit')
			grpHit.add(new Alice_Hit(x, y));
	}

	private function nextState():Void
	{
		FlxG.switchState(new AliceFoundState());
	}

	private function loadPause():Void
	{
		Registry.minigamePaused = 'alice';
		pauseState = new PauseState();
		openSubState(pauseState);
	}
}