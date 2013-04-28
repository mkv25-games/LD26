package world;

import api.IController;
import api.ILevel;
import controllers.GameIntroController;
import controllers.GameOverController;
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
	var floorHeight = 90;
		
	public var player:PlayerEntity;
	public var currentLevel:ILevel;
	public var controller:IController;
	public var messageText:Text;
	public var roomText:Text;
	
	public var defaultController:IController;
	public var gameIntroController:GameIntroController;
	public var fadeInController:FadeInController;
	public var fadeOutController:FadeOutController;
	public var gameOverController:GameOverController;
	
	public function new() 
	{
		super();
		
		defaultController = new LevelController();
		gameIntroController = new GameIntroController();
		fadeInController = new FadeInController();
		fadeOutController = new FadeOutController();
		gameOverController = new GameOverController();
	}
	
	override public function begin()
	{
		camera.x = - HXP.stage.stageWidth / 2;
		camera.y = -HXP.stage.height + floorHeight;
		
		changeController(gameIntroController);
	}
	
	public function startFirstLevel()
	{
		var roomArtwork = LD.data.ARTWORK.getRowCast(ArtworkEnum.ROOM);
		var room = addGraphic(new Stamp(roomArtwork.path, cast - roomArtwork.width / 2, cast - roomArtwork.height + floorHeight));
		room.layer = 5000;
		
		player = cast add(new PlayerEntity());
		player.x = -300;
		player.direction = 1;
		
		for (item in LD.data.ROOM_OBJECT.rowList)
		{
			var itemCast:RoomObjectRow = cast item;
			trace(itemCast.name + ", " + itemCast.artwork.path);
		}
		
		var textOptions1 = { font: "font/futura.ttf", align:TextFormatAlign.CENTER, size: 18, color: 0x675F5F, resizable: false, wordWrap: true };
		messageText = new Text("Welcome to the Game", -100, -250, 200, 60, textOptions1);
		addGraphic(messageText);
		
		var textOptions2 = { font: "font/futura.ttf", align:TextFormatAlign.CENTER, size: 24, color: 0xBAA7A7, resizable: false, wordWrap: true };
		roomText = new Text("BEGIN", -250, -285, 500, 60, textOptions2);
		addGraphic(roomText);
		
		
		changeLevel(LD.levels.getLevel(1));
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
			
		if (currentLevel != null && player.carryObject != null)
			currentLevel.roomObjects.remove(player.carryObject);
			
		currentLevel = level;
		changeController(fadeInController);
		
		if (currentLevel != null && player.carryObject != null)
			currentLevel.roomObjects.add(player.carryObject);
			
		if (currentLevel != null)
		{
			currentLevel.start(this);
			for (item in currentLevel.roomObjects)
			{
				add(item);
			}
		}
	}
	
	override public function update() 
	{
		super.update();
		
		if (controller != null)
			controller.update();
			
		if (currentLevel != null)
			currentLevel.update();
	}
	
	public function setMessageText(text:String)
	{
		messageText.text = text;
		messageText.x = Math.round(player.x - messageText.textWidth / 2);
	}
	
	public function setRoomText(text:String)
	{
		roomText.text = text;
		roomText.x = Math.round(- roomText.textWidth / 2);
	}
}