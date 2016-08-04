package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;
import flixel.system.FlxSound;
import flixel.util.FlxTimer;
import flixel.util.FlxSpriteUtil;

//import flixel.tweens.FlxTween;

class RocketState extends FlxState
{
	private var backTop:FlxSprite;
	private var backBottom:FlxSprite;
	private var trail:FlxSprite;
	private var rocket:FlxSprite;
	private var launchClouds:FlxSprite;
	private var timer:FlxTimer;

	/*private var emitter:FlxEmitter;
	private var emitter0:FlxEmitter;
	private var emitter1:FlxEmitter;
	private var emitter2:FlxEmitter;
	private var emitter3:FlxEmitter;
	private var particle:FlxParticle;*/

	override public function create():Void
	{
		backTop = new FlxSprite(0, 0);
		backTop.loadGraphic('assets/images/launchblock/liftofftop.png');
		add(backTop);

		trail = new FlxSprite(4, 205);
		trail.loadGraphic('assets/images/launchblock/trail.png');
		add(trail);

		backBottom = new FlxSprite(0, 229);
		backBottom.loadGraphic('assets/images/launchblock/liftoffbottom.png');
		add(backBottom);

		launchClouds = new FlxSprite(0, 220);
		launchClouds.loadGraphic('assets/images/launchblock/launchclouds.png');
		add(launchClouds);

		//rocket = new FlxSprite(0, 0);
		//rocket.loadGraphic('assets/images/launchblock/rocket.png');
		//rocket.scale = 0.5;
		//rocket.angle = 70;
		//add(rocket);

		timer = new FlxTimer();
		timer.start(4, timeEnd, 1);

		/*emitter0 = new FlxEmitter(320, 420);
		emitter0.gravity = 1000;
		for (i in 0 ... 200)
		{
			particle = new FlxParticle();
			particle.loadGraphic('assets/images/launchblock/particle3.png');
			particle.exists = false;
			emitter0.add(particle);
		}
		add(emitter0);

		emitter1 = new FlxEmitter(320, 420);
		emitter1.gravity = 1000;
		for (i in 0 ... 200)
		{
			particle = new FlxParticle();
			particle.loadGraphic('assets/images/launchblock/particle3.png');
			particle.exists = false;
			emitter1.add(particle);
		}
		add(emitter1);

		emitter = new FlxEmitter(320, 421);
		emitter.gravity = 1000;
		for (i in 0 ... 200)
		{
			particle = new FlxParticle();
			if (i % 2 == 0)
				particle.loadGraphic('assets/images/launchblock/particle.png');
			else if (i % 2 == 1)
				particle.loadGraphic('assets/images/launchblock/particle2.png');
			particle.exists = false;
			emitter.add(particle);
		}
		add(emitter);

		emitter2 = new FlxEmitter(320, 431);
		emitter2.gravity = 1000;
		for (i in 0 ... 200)
		{
			particle = new FlxParticle();
			if (i % 2 == 0)
				particle.loadGraphic('assets/images/launchblock/particle.png');
			else if (i % 2 == 1)
				particle.loadGraphic('assets/images/launchblock/particle2.png');
			particle.exists = false;
			emitter2.add(particle);
		}
		add(emitter2);

		emitter3 = new FlxEmitter(320, 451);
		emitter3.gravity = 1000;
		for (i in 0 ... 200)
		{
			particle = new FlxParticle();
			if (i % 2 == 0)
				particle.loadGraphic('assets/images/launchblock/particle.png');
			else if (i % 2 == 1)
				particle.loadGraphic('assets/images/launchblock/particle2.png');
			particle.exists = false;
			emitter3.add(particle);
		}
		add(emitter3);*/

		super.create();
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{	
		trail.y -= 0.3;

		super.update();
	}	

	/*private function launch():Void
	{
		emitter0.start(false, 2, 0.01);
		emitter1.start(false, 2, 0.01);
	}

	private function liftoff(Timer:FlxTimer):Void
	{
		emitter.start(false, 2, 0.01);
		emitter2.start(false, 2, 0.01);
		emitter3.start(false, 2, 0.01);
		emitter0.kill();
		emitter1.kill();

		timer.start(3, timeEnd, 1);
	}*/

	private function timeEnd(Timer:FlxTimer):Void
	{
		FlxG.camera.fade(0xff000000, 3, nextState, false);
	}

	private function nextState():Void
	{
		FlxG.switchState(new EndState());
	}
}