package controllers;

import api.IController;
import com.haxepunk.graphics.Text;
import motion.easing.Quad;
import nme.display.BitmapData;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import motion.Actuate;
import nme.display.Sprite;
import nme.filters.BitmapFilter;
import nme.text.TextFormatAlign;

class GameOverController implements IController
{
	var cover:Image;

	public function new() 
	{
		
	}
	
	public function enter():Void
	{
		if (cover == null)
		{
			var b:BitmapData = new BitmapData(800, 400, false, 0x000000);
			cover = new Image(b);
			cover.layer = 1;
		}
		
		LD.world.addGraphic(cover);
		cover.x = - cover.width / 2;
		cover.y = - cover.height + 100;
		cover.alpha = 0.0;
		cover.visible = true;
		Actuate.tween(cover, 1.5, { alpha: 1.0 } ).onComplete(onFadeComplete).ease(Quad.easeOut);
		
		var textOptions = { font: "font/futura.ttf", align:TextFormatAlign.CENTER, size: 24, color: 0xBAA7A7, resizable: false, wordWrap: true };
		var gameOverText = new Text("THANKS FOR PLAYING", -250, -200, 500, 60, textOptions);
		LD.world.addGraphic(gameOverText);
	}
	
	public function update():Void
	{
		
	}
	
	function onFadeComplete():Void
	{
		// LD.world.changeController(LD.world.fadeInController);
	}
	
	public function exit():Void
	{
		cover.visible = false;
	}
}