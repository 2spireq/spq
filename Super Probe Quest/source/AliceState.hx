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
	private var _player:Player;
	private var _map:FlxOgmoLoader;
	private var _mWalls:FlxTilemap;
	private var _grpCleaner:FlxTypedGroup<Cleaner>;
	private var _grpHit:FlxTypedGroup<Alice_Hit>;

	private var pauseState:PauseState;
	private var pauseButton:FlxButton;

	override public function create():Void
	{
		FlxG.camera.flash(0xff000000, 1, null, false);
		
		_map = new FlxOgmoLoader('assets/data/maze.oel');
		_mWalls = _map.loadTilemap('assets/images/alicemaze/b-map.png', 16, 16, 'walls');
		_mWalls.setTileProperties(1, FlxObject.ANY);
		_mWalls.setTileProperties(2, FlxObject.NONE);
		_mWalls.setTileProperties(3, FlxObject.ANY);
		_mWalls.setTileProperties(4, FlxObject.ANY);
		_mWalls.setTileProperties(5, FlxObject.ANY);
		_mWalls.setTileProperties(6, FlxObject.ANY);
		_mWalls.setTileProperties(7, FlxObject.ANY);
		_mWalls.setTileProperties(8, FlxObject.ANY);
		_mWalls.setTileProperties(9, FlxObject.ANY);
		_mWalls.setTileProperties(10, FlxObject.ANY);
		_mWalls.setTileProperties(11, FlxObject.ANY);
		_mWalls.setTileProperties(12, FlxObject.ANY);
		_mWalls.setTileProperties(13, FlxObject.ANY);
		_mWalls.setTileProperties(14, FlxObject.ANY);
		_mWalls.setTileProperties(15, FlxObject.ANY);
		_mWalls.setTileProperties(16, FlxObject.ANY);
		_mWalls.setTileProperties(17, FlxObject.NONE);
		_mWalls.setTileProperties(18, FlxObject.ANY);
		_mWalls.setTileProperties(19, FlxObject.ANY);
		_mWalls.setTileProperties(20, FlxObject.ANY);
		add(_mWalls);

		_grpCleaner = new FlxTypedGroup<Cleaner>();
		_grpHit = new FlxTypedGroup<Alice_Hit>();
 
		_player = new Player();
	
		_map.loadEntities(placeEntities, 'entities');
		add(_player);
		add(_grpCleaner);
		add(_grpHit);

		FlxG.camera.height = 480;
		FlxG.camera.width = 640;
		//FlxG.camera.zoom = 2;
		FlxG.camera.follow(_player, FlxCamera.STYLE_TOPDOWN, 1);

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
		//FlxG.camera.zoom = 2;
		super.update();
		FlxG.collide(_player, _mWalls);
		FlxG.overlap(_player, _grpCleaner, playerCleanerInteract);
		FlxG.overlap(_player, _grpHit, playerHitInteract);
	}	

	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get('x'));
		var y:Int = Std.parseInt(entityData.get('y'));
		if (entityName == 'player')
		{
			_player.x = x;
			_player.y = y;
		}
		else if (entityName == 'cleaner')
		{
			_grpCleaner.add(new Cleaner(x, y));
		}
		else if (entityName == 'alice_hit')
		{
			_grpHit.add(new Alice_Hit(x, y));
		}
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