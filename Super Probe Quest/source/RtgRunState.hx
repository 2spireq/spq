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

class RtgRunState extends FlxState
{
	private var sky:FlxSprite;
	private var background:FlxSprite;
	private var clouds:FlxSprite;

	private var cloudsRepeat:Bool;

	private var map:FlxOgmoLoader;
	private var walls:FlxTilemap;
	private var player:RtgPlayer;

	private var grpParts0:FlxTypedGroup<Rtg0>;
	private var grpParts1:FlxTypedGroup<Rtg1>;
	private var grpParts2:FlxTypedGroup<Rtg2>;
	private var grpParts3:FlxTypedGroup<Rtg3>;

	private var p0:Rtg0;

	override public function create():Void
	{
		cloudsRepeat = false;

		sky = new FlxSprite(0, 0);
		sky.loadGraphic('assets/images/rtgrun/sky.png');
		add(sky);

		clouds = new FlxSprite(-800, 0);
		clouds.loadGraphic('assets/images/rtgrun/clouds.png');
		if (cloudsRepeat == false)
			clouds.scrollFactor.x = -0.3;
		add(clouds);

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

		walls.setTileProperties(1, FlxObject.NONE);
		walls.setTileProperties(2, FlxObject.NONE);
		walls.setTileProperties(3, FlxObject.NONE);
		walls.setTileProperties(4, FlxObject.NONE);
		walls.setTileProperties(14, FlxObject.NONE);
		walls.setTileProperties(16, FlxObject.NONE);
		walls.setTileProperties(17, FlxObject.NONE);
		walls.setTileProperties(18, FlxObject.NONE);
		walls.setTileProperties(56, FlxObject.NONE);
		walls.setTileProperties(64, FlxObject.NONE);
		walls.setTileProperties(65, FlxObject.NONE);

		FlxG.camera.follow(player, FlxCamera.STYLE_TOPDOWN, 1);

		super.create();
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	private function playerHitInteract(P:Player, H:Rtg0):Void
	{
		if (P.alive && P.exists && H.alive && H.exists)
		{
			H.kill();
			hitInteract0();
		}
		trace('hit interact');
	}

	private function hitInteract0():Void
	{
		trace('part 0');
	}

	override public function update():Void
	{	
		if (cloudsRepeat == true)
		{
			if (clouds.x <= 640)
			{
				clouds.x += 0.3;
			}
			else if (clouds.x >= 2560)
			{
				clouds.x = -800;
			}
		}

		FlxG.collide(walls, player);
		FlxG.overlap(player, grpParts0, playerHitInteract);

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
	    else if (entityName == 'p0')
	    {
	    	grpParts0.add(new Rtg0(x, y));
	    }
	}

	private function interact0():Void
	{
		trace('0');
	}

}