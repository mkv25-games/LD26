package controllers;

import api.IController;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import motion.Actuate;
import nme.display.BitmapData;
import nme.display.Sprite;
import nme.filters.BitmapFilter;
import player.PlayerEntity;

class LevelController implements IController
{
	public function new() 
	{
		
	}
	
	public function enter():Void
	{
		
	}
	
	public function update():Void
	{
		if (LD.world.player.x >= 400)
		{
			LD.world.player.x = -390;
			LD.world.player.idle();
			LD.world.changeController(LD.world.fadeOutController);
			LD.world.currentLevel.nextLevel();
		}
		else if (LD.world.player.x <= -400)
		{
			LD.world.player.x = 390;
			LD.world.player.idle();
			LD.world.changeController(LD.world.fadeOutController);
			LD.world.currentLevel.nextLevel();
		}
		else
		{
			LD.world.player.playerUpdate();
		}
	}
	
	public function exit():Void
	{
		
	}
}