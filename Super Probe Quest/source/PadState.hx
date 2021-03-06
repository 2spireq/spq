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

class PadState extends FlxState
{
	private var back:FlxSprite;
	private var pad:FlxSprite;
	private var rocket:FlxSprite;
	private var cloud0:FlxSprite;
	private var smoke:FlxSprite;
	private var panel:FlxSprite;
	private var buttonLaunch:FlxButton;
	private var launchSound:FlxSound;
	private var backButton:FlxButton;
	private var timer:FlxTimer;
	private var liftoffTimer:FlxTimer;

	private var emitter:FlxEmitter;
	private var emitter0:FlxEmitter;
	private var emitter1:FlxEmitter;
	private var emitter2:FlxEmitter;
	private var emitter3:FlxEmitter;
	private var particle:FlxParticle;

	private var panelX:Int = 30;
	private var panelY:Int = 300;
	private var launched:Bool = false;

	override public function create():Void
	{
		FlxG.camera.flash(0xff000000, 1, null, false);
	
		launchSound = FlxG.sound.load('assets/sounds/launch.wav');

		back = new FlxSprite(0, 0);
		back.loadGraphic('assets/images/launchblock/skyback.png');
		add(back);

		cloud0 = new FlxSprite(-540, 257);
		cloud0.loadGraphic('assets/images/rtgrun/clouds.png');
		add(cloud0);

		pad = new FlxSprite(0, 0);
		/*if (Registry.launchReady == null)
			pad.loadGraphic('assets/images/launchblock/pad-norocket.png');*/
		if (Registry.launchReady == true)
			pad.loadGraphic('assets/images/launchblock/pad-rocket.png');
		else
			pad.loadGraphic('assets/images/launchblock/pad-norocket.png');
		add(pad);

		rocket = new FlxSprite(0, 0);
		rocket.loadGraphic('assets/images/launchblock/rocket.png');

		if (Registry.launchReady == false)
		{
			backButton = new FlxButton(10, 10, '', loadMenu);
			backButton.loadGraphic('assets/images/menu/button_back.png', false, 67, 32);
			backButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');
			add(backButton);
		}

		timer = new FlxTimer();
		liftoffTimer = new FlxTimer();

		emitter0 = new FlxEmitter(320, 420);
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
		add(emitter3);

		if (Registry.launchReady == true)
		{
			panel = new FlxSprite(panelX, panelY);
			panel.loadGraphic('assets/images/launchblock/controlpanel.png');
			add(panel);

			buttonLaunch = new FlxButton(panelX + 12, panelY + 39, '', launch);
			buttonLaunch.loadGraphic('assets/images/launchblock/button_launch.png', false, 143, 65);
			add(buttonLaunch);
		}

		super.create();
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{	
		if (cloud0.x <= 640)
			cloud0.x += 0.2;
		else if (cloud0.x >= 640)
			cloud0.x = -776;

		if (launched == true)
		{
			if (panel.y != 481)
				panel.y += 2;
			if (buttonLaunch.y != 520)
				buttonLaunch.y += 2;

			pad.loadGraphic('assets/images/launchblock/pad-norocket.png');

			add(rocket);

			rocket.y -= 1;
			emitter.y -= 1;
			emitter2.y -= 1;
			emitter3.y -= 1;
		}

		super.update();
	}	

	private function loadMenu():Void
	{
		FlxG.switchState(new PlayState());
	}

	private function launch():Void
	{
		liftoffTimer.start(2, liftoff, 1);
		emitter0.start(false, 2, 0.01);
		emitter1.start(false, 2, 0.01);
	}

	private function liftoff(Timer:FlxTimer):Void
	{
		FlxG.camera.shake(0.003, 100);
		launched = true;
		emitter.start(false, 2, 0.01);
		emitter2.start(false, 2, 0.01);
		emitter3.start(false, 2, 0.01);
		emitter0.kill();
		emitter1.kill();

		launchSound.play();
		timer.start(4, nextState, 1);
		launchClouds();
	}

	private function launchClouds():Void
	{
		smoke = new FlxSprite(0, 0);
		smoke.loadGraphic('assets/images/launchblock/smoke.png');
		FlxSpriteUtil.fadeIn(smoke, 1, true, null);
		add(smoke);
	}

	//private function timeEnd(Timer:FlxTimer):Void
	//{
	//	FlxG.camera.fade(0xff000000, 3, nextState, false);
	//}

	//private function nextState():Void
	private function nextState(Timer:FlxTimer):Void
	{
		FlxG.switchState(new RocketState());
	}
}