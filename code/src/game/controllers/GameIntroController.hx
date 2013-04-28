package controllers;

import api.IController;
import motion.easing.Quad;
import net.mkv25.ld26.enums.ArtworkEnum;
import nme.display.BitmapData;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import motion.Actuate;
import nme.display.Sprite;
import nme.filters.BitmapFilter;

class GameIntroController implements IController
{
	var cover:Image;

	public function new() 
	{
		
	}
	
	public function enter():Void
	{
		if (cover == null)
		{
			var artwork = LD.data.ARTWORK.getRowCast(ArtworkEnum.TITLE_SCREEN);
			cover = new Image(artwork.path);
			cover.layer = 3;
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
		Actuate.timer(2.0).onComplete(onDelayComplete);
	}
	
	function onDelayComplete():Void
	{
		LD.world.changeController(LD.world.fadeOutController);
		LD.world.startFirstLevel();
	}
	
	public function exit():Void
	{
		cover.visible = false;
	}
}