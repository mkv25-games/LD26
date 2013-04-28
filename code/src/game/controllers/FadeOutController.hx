package controllers;

import api.IController;
import motion.easing.Quad;
import nme.display.BitmapData;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import motion.Actuate;
import nme.display.Sprite;
import nme.filters.BitmapFilter;

class FadeOutController implements IController
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
	}
	
	public function update():Void
	{
		
	}
	
	function onFadeComplete():Void
	{
		LD.world.changeController(LD.world.fadeInController);
	}
	
	public function exit():Void
	{
		cover.visible = false;
	}
}