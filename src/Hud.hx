import flash.display.Sprite;
import flash.display.Bitmap;
import flash.text.TextField;
import flash.display.BitmapData;

import mt.deepnight.Lib;
import mt.deepnight.Tweenie;
import mt.deepnight.slb.*;
import mt.MLib;
import mt.Metrics;

class Hud {
	static var BMARGIN = 30;

	var game				: m.Game;
	public var wrapper		: Sprite;
	var chronoField			: TextField;
	var chronoBg			: BSprite;
	var scoreTf				: TextField;
	var scoreBg				: BSprite;
	var timeWarning			: Bitmap;
	var twChronoSet			: Bool;

	var menuBt				: BSprite;
	public var button0		: BSprite;

	var side0				: Null<Bitmap>;
	var side1				: Null<Bitmap>;

	public function new() {
		game = m.Game.ME;
		twChronoSet = false;

		wrapper = new Sprite();
		game.gdm.add(wrapper, Const.DP_INTERF);
		wrapper.mouseEnabled = false;

		// Time warning
		var s = new Sprite();
		var w = game.getWidth()*0.8;
		var h = game.getHeight()*0.6;
		var m = new flash.geom.Matrix();
		m.createGradientBox(w,h*2, 0, 0,-h);
		s.graphics.beginGradientFill(flash.display.GradientType.RADIAL, [0xFF0000,0xFF0000], [1,0], [0,255], m);
		s.graphics.drawRect(0,0, w,h);
		timeWarning = mt.deepnight.Lib.flatten(s);
		wrapper.addChild(timeWarning);
		timeWarning.visible = false;

		// Timer bg
		chronoBg = game.tiles.get("bgTime");
		wrapper.addChild(chronoBg);
		chronoBg.mouseChildren = chronoBg.mouseEnabled = false;
		chronoBg.scaleX = chronoBg.scaleY = 2;

		chronoField = makeLabel("0:00");
		wrapper.addChild(chronoField);
		chronoField.mouseEnabled = false;

		// Score bg (same as time)
		scoreBg = game.tiles.get("bgTime");
		wrapper.addChild(scoreBg);
		scoreBg.mouseChildren = scoreBg.mouseEnabled = false;
		scoreBg.scaleX = scoreBg.scaleY = 2;

		scoreTf = makeLabel("");
		wrapper.addChild(scoreTf);
		scoreTf.mouseEnabled = false;
		updateScore();

		// Menu button
		menuBt = game.tiles.get("pauseButton");
		wrapper.addChild(menuBt);
		menuBt.graphics.beginFill(0x00FF00, 0);
		menuBt.graphics.drawCircle(menuBt.width*0.5, menuBt.height*0.5, 40);
		menuBt.addEventListener( flash.events.MouseEvent.CLICK, function(_) onMenu());

		// Action button 0
		button0 = game.tiles.get("buttonShoot");
		wrapper.addChild(button0);
		button0.mouseChildren = button0.mouseEnabled = false;
		button0.visible = !game.isMulti();

		if( game.isMulti() ) {
			var pt0 = new flash.geom.Point();
			var s = new Sprite();
			s.graphics.beginFill(0x0080FF,1);
			s.graphics.drawCircle(0,0,50);
			side0 = Lib.flatten(s, 64);
			side0.bitmapData.applyFilter(side0.bitmapData, side0.bitmapData.rect, pt0, new flash.filters.BlurFilter(64,64));
			wrapper.addChild(side0);

			var s = new Sprite();
			s.graphics.beginFill(0xE01F24,1);
			s.graphics.drawCircle(0,0,50);
			side1 = Lib.flatten(s, 64);
			side1.bitmapData.applyFilter(side1.bitmapData, side1.bitmapData.rect, pt0, new flash.filters.BlurFilter(64,64));
			wrapper.addChild(side1);
		}

		onResize();
	}

	function makeLabel(str:String) : TextField {
		var f = new flash.text.TextFormat();
		f.font = m.Global.ME.getFont().id;
		f.size = 10;
		f.color = 0xffffff;
		var tf = new flash.text.TextField();
		tf.width = 120;
		tf.height = 22;
		tf.mouseEnabled = tf.selectable = false;
		tf.defaultTextFormat = f;
		tf.embedFonts = true;
		tf.text = str;
		tf.filters = [
			new flash.filters.GlowFilter(0x0,1, 2,2,5),
		];
		return tf;
	}

	public inline function setPassButton() {
		button0.set("buttonShoot");
	}

	public inline function setDefendButton() {
		button0.set("buttonTacle");
	}

	function onMenu() {
		game.onMenu();
	}


	public function onResize() {
		chronoField.y = 2;

		menuBt.x = game.getWidth() - 35;
		menuBt.y = 3;

		button0.y = game.getHeight()-button0.height-BMARGIN;

		chronoBg.x = Std.int( menuBt.x  - 5 - chronoBg.width );
		chronoBg.y = 0;

		scoreBg.x = 3;
		scoreBg.y = 2;

		if( side0!=null ) {
			side0.width = 200;
			side0.height = game.getHeight()*1.2;
			side0.x = -side0.width*0.5;
			side0.y = game.getHeight()*0.5 - side0.height*0.5;
		}

		if( side1!=null ) {
			side1.width = 200;
			side1.height = game.getHeight()*1.2;
			side1.x = game.getWidth()-side1.width*0.5;
			side1.y = game.getHeight()*0.5 - side1.height*0.5;
		}
	}


	public function destroy() {
		wrapper.parent.removeChild(wrapper);

		chronoBg.dispose();
		scoreBg.dispose();
		menuBt.dispose();
		button0.dispose();

		timeWarning.bitmapData.dispose(); timeWarning.bitmapData = null;
	}


	public function updateValues() {
		updateChrono();
		updateScore();
	}

	function updateChrono() {
		var c = Std.int( game.chrono/Const.FPS );
		var mins = Std.int( c/60 );
		var sec = Std.int( c-mins*60 );
		if( mins<0 ) mins = 0;
		if( sec<0 ) sec = 0;
		chronoField.text = mins+":"+mt.deepnight.Lib.leadingZeros(sec,2);
		chronoField.x = Std.int( chronoBg.x + chronoBg.width*0.5 - chronoField.textWidth*0.5 - 3 );

		if( mins==0 && sec<=20 )
			chronoField.textColor = 0xFF8600;
		else
			chronoField.textColor = 0xffffff;

		if( mins<=0 && sec>0 ) {
			timeWarning.x = chronoField.x - timeWarning.width*0.5;
			if( sec<=10 ) {
				game.tw.terminateWithoutCallbacks(timeWarning.alpha);
				timeWarning.visible = true;
				timeWarning.alpha = 1;
				game.tw.create(timeWarning.alpha, 0, TEaseIn, 600);
				if( !twChronoSet ) {
					twChronoSet = true;
					game.tw.create(chronoField.y, chronoField.y-4, TLoop, 200);
				}
				m.Global.SBANK.compte_a_rebour(0.2 + 0.8*(1-sec/10));
			}
			else if( sec<=20 ) {
				twChronoSet = false;
				game.tw.terminateWithoutCallbacks(timeWarning.alpha);
				game.tw.terminateWithoutCallbacks(chronoField.y);
				timeWarning.visible = true;
				timeWarning.alpha = 0.6;
				game.tw.create(timeWarning.alpha, 0, TEaseIn, 300);
			}
		} else {
			twChronoSet = false;
			game.tw.terminateWithoutCallbacks(chronoField.y);
		}
	}


	function updateScore() {
		scoreTf.text = game.score + " / " + game.getScoreTarget();
		scoreTf.x = Std.int( scoreBg.x + scoreBg.width*0.5 - scoreTf.textWidth*0.5 - 3 );
		scoreTf.y = scoreBg.y + 1;
	}


	public function update() {
		var isActive = en.Player.getActive(0)!=null;
		if( isActive && button0.alpha<0.8 )
			button0.alpha += (0.8-button0.alpha)*0.2;

		if( !isActive && button0.alpha>0.2 )
			button0.alpha += (0.2-button0.alpha)*0.2;

		button0.x = m.Global.ME.playerCookie.data.leftHanded ? BMARGIN : game.getWidth()-button0.width-BMARGIN;
	}
}
