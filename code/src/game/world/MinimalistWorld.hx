package world;

import api.IController;
import api.ILevel;
import com.haxepunk.graphics.Stamp;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import controllers.FadeInController;
import controllers.FadeOutController;
import controllers.LevelController;
import levels.Level01;
import net.mkv25.ld26.enums.ArtworkEnum;
import player.PlayerEntity;

class MinimalistWorld extends Scene
{
	public var player:PlayerEntity;
	public var currentLevel:ILevel;
	public var controller:IController;
	
	public var defaultController:IController;
	public var fadeInController:FadeInController;
	public var fadeOutController:FadeOutController;
	
	public function new() 
	{
		super();
		
		defaultController = new LevelController();
		fadeInController = new FadeInController();
		fadeOutController = new FadeOutController();
	}
	
	override public function begin()
	{
		camera.x = - HXP.stage.stageWidth / 2;
		camera.y = -HXP.stage.height + 100;
		
		var roomArtwork = LD.data.ARTWORK.getRowCast(ArtworkEnum.ROOM);
		var room = addGraphic(new Stamp(roomArtwork.path, cast - roomArtwork.width / 2, cast - roomArtwork.height + 100));
		room.layer = 5000;
		
		changeLevel(new Level01());
		
		player = cast add(new PlayerEntity());
		changeController(fadeInController);
	}
	
	public function changeController(newController:IController)
	{
		if (newController == controller)
			return;
			
		if (controller != null)
			controller.exit();
		
		controller = newController;
		
		if(controller != null)
			controller.enter();
	}
	
	public function resetController()
	{
		changeController(defaultController);
	}
	
	public function changeLevel(level:ILevel)
	{
		if (currentLevel == level)
			return;
		
		currentLevel = level;
		changeController(fadeInController);
		
		if(currentLevel != null)
			currentLevel.start(this);
	}
	
	override public function update() 
	{
		super.update();
		
		if (controller != null)
			controller.update();
	}
}