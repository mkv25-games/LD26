package controllers;

import api.IController;
import com.haxepunk.graphics.Text;
import motion.easing.Quad;
import net.mkv25.ld26.enums.ArtworkEnum;
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
			var artwork = LD.data.ARTWORK.getRowCast(ArtworkEnum.GAME_OVER_SCREEN);
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
		// LD.world.changeController(LD.world.fadeInController);
	}
	
	public function exit():Void
	{
		cover.visible = false;
	}
}