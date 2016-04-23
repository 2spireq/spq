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

class RtgRunState extends FlxState
{
	private var sky:FlxSprite;
	private var background:FlxSprite;
	private var clouds:FlxSprite;

	private var map:FlxOgmoLoader;
	private var walls:FlxTilemap;

	private var player:RtgPlayer;

	override public function create():Void
	{
		sky = new FlxSprite(0, 0);
		sky.loadGraphic('assets/images/rtgrun/sky.png');
		add(sky);

		clouds = new FlxSprite(-800, 0);
		clouds.loadGraphic('assets/images/rtgrun/clouds.png');
		//clouds.scrollFactor.x = -0.3;
		add(clouds);

		background = new FlxSprite(0, 0);
		background.loadGraphic('assets/images/rtgrun/background.png');
		background.scrollFactor.x = 0.2;
		add(background);

		map = new FlxOgmoLoader('assets/data/plats.oel');
		//map.loadEntities(placeEntities, "entities");

		walls = map.loadTilemap('assets/images/rtgrun/placeholder.png', 16, 16, 'walls');
		add(walls);

		walls.setTileProperties(1, FlxObject.NONE);
		walls.setTileProperties(2, FlxObject.NONE);
		walls.setTileProperties(3, FlxObject.NONE);
		walls.setTileProperties(4, FlxObject.NONE);
		//walls.setTileProperties(5, FlxObject.NONE);
		walls.setTileProperties(14, FlxObject.NONE);

		player = new RtgPlayer(20, 20);
		add(player);

		FlxG.camera.follow(player, FlxCamera.STYLE_TOPDOWN, 1);

		super.create();
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{	
		if (clouds.x <= 640)
		{
			clouds.x += 0.3;
		}
		else if (clouds.x >= 2560)
		{
			clouds.x = -800;
		}

		FlxG.collide(walls, player);

		super.update();
	}	

	private function loadMenu():Void
	{
		FlxG.switchState(new PlayState());
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
	}
}