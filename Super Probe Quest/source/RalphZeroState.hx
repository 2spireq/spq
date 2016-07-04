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
import Std.int;

class RalphZeroState extends FlxState
{
	private var pauseState:PauseState;
	private var pauseButton:FlxButton;

	private var map:FlxOgmoLoader;
	private var walls:FlxTilemap;
	private var player:RalphPlayer;
	//private var p0:Rtg0;
	//private var grpParts0:FlxTypedGroup<Rtg0>;

	override public function create():Void
	{
		pauseState = new PauseState();
		pauseButton = new FlxButton(10, 10, '', loadPause);
		pauseButton.loadGraphic('assets/images/pause/button_pause.png', false, 32, 32);
		add(pauseButton);

		player = new RalphPlayer(20, 200);
		map.loadEntities(placeEntities, 'entities');
		add(player);

		FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER, 1);
		
		super.create();
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{	
		super.update();
	}	

	private function loadPause():Void
	{
		Registry.minigamePaused = 'ralph';
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
		//else if (entityName == 'p0')
		//	grpParts0.add(new Rtg0(x, y));
	}
}