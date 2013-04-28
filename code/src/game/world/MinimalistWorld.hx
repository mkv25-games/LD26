package world;

import api.IController;
import api.ILevel;
import nme.text.TextFormatAlign;
import com.haxepunk.graphics.Stamp;
import com.haxepunk.graphics.Text;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import controllers.FadeInController;
import controllers.FadeOutController;
import controllers.LevelController;
import levels.Level01;
import net.mkv25.ld26.dbvos.RoomObjectRow;
import net.mkv25.ld26.enums.ArtworkEnum;
import player.PlayerEntity;

class MinimalistWorld extends Scene
{
	public var player:PlayerEntity;
	public var currentLevel:ILevel;
	public var controller:IController;
	public var messageText:Text;
	
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
		var floorHeight = 90;
		camera.x = - HXP.stage.stageWidth / 2;
		camera.y = -HXP.stage.height + floorHeight;
		
		var roomArtwork = LD.data.ARTWORK.getRowCast(ArtworkEnum.ROOM);
		var room = addGraphic(new Stamp(roomArtwork.path, cast - roomArtwork.width / 2, cast - roomArtwork.height + floorHeight));
		room.layer = 5000;
		
		changeLevel(LD.levels.getLevel(1));
		
		player = cast add(new PlayerEntity());
		player.x = -60;
		changeController(fadeInController);
		
		for (item in LD.data.ROOM_OBJECT.rowList)
		{
			var itemCast:RoomObjectRow = cast item;
			trace(itemCast.name + ", " + itemCast.artwork.path);
		}
		
		var textOptions = { font: "font/futura.ttf", align:TextFormatAlign.CENTER, size: 18, color: 0x675F5F, resizable: false, wordWrap: true };
		messageText = new Text("Welcome to the Game", -100, -250, 200, 60, textOptions);
		addGraphic(messageText);
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
			
		if (currentLevel != null)
			currentLevel.exit();
		
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
	
	public function setMessageText(text:String)
	{
		messageText.text = text;
		messageText.x = Math.round(player.x - messageText.textWidth / 2);
	}
}