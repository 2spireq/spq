package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxAngle;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.ogmo.FlxOgmoLoader;

class Player extends FlxSprite
{
	public var speed:Float = 200;
	public var angleAttack:Float = 0;

	private var _up:Bool = false;
	private var _down:Bool = false;
	private var _left:Bool = false;
	private var _right:Bool = false;

    public function new(X:Float = 0, Y:Float = 0)
    {
        super(X, Y);
        loadGraphic('assets/images/alicemaze/player.png', true, 16, 16);
        setFacingFlip(FlxObject.LEFT, false, false);
		setFacingFlip(FlxObject.RIGHT, true, false);
		animation.add("lr", [3, 4, 3, 5], 6, false);
		animation.add("u", [6, 7, 6, 8], 6, false);
		animation.add("d", [0, 1, 0, 2], 6, false);

        drag.x = drag.y = 1000;
        setSize(8, 14);
		offset.set(4, 2);
    }

    public function movement():Void
    {
		_up = FlxG.keys.pressed.W;
		_down = FlxG.keys.pressed.S;
		_left = FlxG.keys.pressed.A;
		_right = FlxG.keys.pressed.D;

		if (_up && _down)
    		_up = _down = false;
		if (_left && _right)
    		_left = _right = false;

    	if (_up || _down || _left || _right)
    	{
    		angleAttack = 0;
			if (_up)
			{
			    angleAttack = -90;
			    if (_left)
			        angleAttack -= 45;
			    else if (_right)
			        angleAttack += 45;
			    facing = FlxObject.UP;
			}
			else if (_down)
			{
			    angleAttack = 90;
			    if (_left)
			        angleAttack += 45;
			    else if (_right)
			        angleAttack -= 45;
			    facing = FlxObject.DOWN;
			}
			else if (_left)
			{
			    angleAttack = 180;
			    facing = FlxObject.LEFT;
			}
			else if (_right)
			{
			    angleAttack = 0;
			    facing = FlxObject.RIGHT;
			}
			FlxAngle.rotatePoint(speed, 0, 0, 0, angleAttack, velocity);
			if ((velocity.x != 0 || velocity.y != 0) && touching == FlxObject.NONE)
			{
			    switch (facing)
			    {
			        case FlxObject.LEFT, FlxObject.RIGHT:
			            animation.play("lr");
			        case FlxObject.UP:
			            animation.play("u");
			        case FlxObject.DOWN:
			            animation.play("d");
			    }
			}
		}
	}

	override public function update():Void
	{
		movement();
		super.update();
	}
}