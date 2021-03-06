package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.text.FlxText;
import Sys;
import openfl.display.FPS;
using flixel.util.FlxSpriteUtil;

class MenuState extends FlxState
{
	private var splashStarBack:FlxSprite;
	private var splashHero:FlxSprite;

	private var splashPlayButton:FlxButton;
	private var splashAboutButton:FlxButton;
	private var splashQuitButton:FlxButton;
	private var splashFullButton:FlxButton;
	private var splashDebugButton:FlxButton;
	private var splashFactButton:FlxButton;
	private var splashSettingsButton:FlxButton;

	private var rPluto:FlxSprite;
	private var rCharon:FlxSprite;
	private var rStyx:FlxSprite;
	private var rNix:FlxSprite;
	private var rKerberos:FlxSprite;
	private var rHydra:FlxSprite;

	private var rPlutoAngle:Int;

	private var baseX:Int;
	private var baseY:Int;
	private var quitX:Int;
	private var quitY:Int;

	private var isDebugOn:Bool = false;

	private var debugCoordX:FlxText;
	private var debugCoordY:FlxText;

	private var coordsBlock:FlxSprite;

	override public function create():Void
	{
		Registry.haveAlice = false;
		//Registry.haveLorri = false;
		//Registry.havePepssi = false;
		Registry.haveRalph = false;
		Registry.haveSwap = false;
		Registry.haveRtg = false;
		Registry.haveRex = false;
		Registry.haveHeat = false;
		Registry.launchReady = false;
		Registry.partsNo = 0;

		trace(' started');

		FlxG.mouse.useSystemCursor = true;
		FlxG.mouse.visible = true;

		FlxG.camera.flash(0xff000000, 0.5, null, false);

		FlxG.sound.play('assets/music/menu_main.ogg', 1, true, false);

		splashStarBack = new FlxSprite(0, 0);
		splashStarBack.loadGraphic('assets/images/menu/starback.png');

		splashHero = new FlxSprite(0,0);
		splashHero.loadGraphic('assets/images/menu/splash_x640.png');

		splashPlayButton = new FlxButton(121, 250, '', loadPlay);
		splashPlayButton.loadGraphic('assets/images/menu/button_begin.png', false, 121, 32);
		splashPlayButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');

		splashSettingsButton = new FlxButton(121, 300, '', loadSettings);
		splashSettingsButton.loadGraphic('assets/images/menu/button_settings.png', false, 121, 32);
		splashSettingsButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');

		quitX = 121;
		quitY = 350;

		splashQuitButton = new FlxButton(quitX + 88, quitY, '', quit);
		splashQuitButton.loadGraphic('assets/images/menu/button_quit.png', false, 32, 32);
		splashQuitButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');

		splashFactButton = new FlxButton(quitX + 44, quitY, '', loadFacts);
		splashFactButton.loadGraphic('assets/images/menu/button_trivia.png', false, 32, 32);
		splashFactButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');

		splashAboutButton = new FlxButton(quitX, quitY, '', loadAbout);
		splashAboutButton.loadGraphic('assets/images/menu/button_about.png', false, 32, 32);
		splashAboutButton.onDown.sound = FlxG.sound.load('assets/sounds/select.wav');

		baseX = 440;
		baseY = 360;

		rPluto = new FlxSprite(baseX, baseY);
		rPluto.loadGraphic('assets/images/menu/moons/Pluto.png');

		rCharon = new FlxSprite(baseX - 32, baseY - 32);
		rCharon.loadGraphic('assets/images/menu/moons/CharonOrbit.png');

		rStyx = new FlxSprite(baseX - 64, baseY - 64);
		rStyx.loadGraphic('assets/images/menu/moons/StyxOrbit.png');

		rNix = new FlxSprite(baseX - 96, baseY - 96);
		rNix.loadGraphic('assets/images/menu/moons/NixOrbit.png');

		rKerberos = new FlxSprite(baseX - 128, baseY - 128);
		rKerberos.loadGraphic('assets/images/menu/moons/KerberosOrbit.png');

		rHydra = new FlxSprite(baseX - 160, baseY - 160);
		rHydra.loadGraphic('assets/images/menu/moons/HydraOrbit.png');

		rPlutoAngle = 270;
		rPluto.angle = rPlutoAngle;
		rCharon.angle = rPlutoAngle;
		rStyx.angle = rPlutoAngle;
		rNix.angle = rPlutoAngle;
		rKerberos.angle = rPlutoAngle;
		rHydra.angle = rPlutoAngle;

		add(splashStarBack);
		add(splashHero);
		add(splashPlayButton);
		add(splashAboutButton);
		add(splashFactButton);
		add(splashQuitButton);
		add(splashSettingsButton);

		add(rHydra);
		add(rKerberos);
		add(rNix);
		add(rStyx);
		add(rCharon);
		add(rPluto);

		super.create();
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		rPluto.angle += 0.1;
		rCharon.angle += 1.7;
		rStyx.angle += 1.5;
		rNix.angle += 1.1;
		rKerberos.angle += 0.8;
		rHydra.angle += 0.5;

		debugOnCheck();

		super.update();
	}	

	private function loadPlay():Void
	{
		FlxG.switchState(new BeginWarnState());
	}

	private function loadAbout():Void
	{
		FlxG.switchState(new AboutState());
	}

	private function loadFacts():Void
	{
		FlxG.switchState(new FactState());
	}

	private function quit():Void
	{
		Sys.exit(0);
	}

	private function toggleFull():Void
	{
		FlxG.fullscreen = !FlxG.fullscreen;
	}

	private function loadSettings():Void
	{
		FlxG.switchState(new SettingsState());
		trace('load settings');
	}

	private function toggleDebug():Void
	{
		if (isDebugOn == false)
			isDebugOn = true;
		else if (isDebugOn == true)
		{
			if (debugCoordX.alive && debugCoordX.exists && debugCoordY.alive && debugCoordY.exists)
			{
				debugCoordX.kill();
				debugCoordY.kill();
			}

			isDebugOn = false;
		}
	}

	private function debugOnCheck():Void
	{
		if (isDebugOn == true)
		{
			coordsBlock = new FlxSprite(0, 460);
			coordsBlock.loadGraphic('assets/images/menu/coordsblock.png');
			debugCoordX = new FlxText(0, 460, 0, FlxG.mouse.x + '', 12, false);
			debugCoordY = new FlxText(30, 460, 0, FlxG.mouse.y + '', 12, false);

			add(coordsBlock);
			add(debugCoordX);
			add(debugCoordY);
		}
	}
}