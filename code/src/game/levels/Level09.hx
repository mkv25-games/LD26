package levels;

import api.ILevel;
import com.haxepunk.Scene;
import motion.Actuate;
import net.mkv25.ld26.dbvos.RoomObjectRow;
import net.mkv25.ld26.enums.AudioEnum;
import net.mkv25.ld26.enums.RoomObjectEnum;
import world.MinimalistWorld;

class Level09 extends BaseLevel implements ILevel
{
	var plant:RoomObjectEntity;
	var recycler:RoomObjectEntity;
	
	var init:Bool = false;
	var itemConversions:Int = 0;
	
	var tasksCompleted:Int = 0;
	
	public function start(world:Scene):Void
	{
		this.world = world;
		if (init == false)
		{
			plant = addRoomObject(plant, RoomObjectEnum.PLANT, 0, -50);
			
			recycler = addRoomObject(recycler, RoomObjectEnum.BOX, 0, -100);
			recycler.moveable = false;
			recycler.toggleState = LD.getRoomObject(RoomObjectEnum.CARD_MACHINE_ON);
			
			addRoomObject(null, RoomObjectEnum.TABLE, -240, -50);
			addRoomObject(null, RoomObjectEnum.TABLE, -180, -50);
			addRoomObject(null, RoomObjectEnum.TABLE, 0, -50);
			addRoomObject(null, RoomObjectEnum.TABLE, 180, -50);
			addRoomObject(null, RoomObjectEnum.TABLE, -240, -50);
			
			addRoomObject(null, RoomObjectEnum.STAR, -240, -100);
			addRoomObject(null, RoomObjectEnum.TELEPHONE, -180, -100);
			addRoomObject(null, RoomObjectEnum.PASS_CARD, 0, -100);
			addRoomObject(null, RoomObjectEnum.LAMP_ON, 180, -100);
			addRoomObject(null, RoomObjectEnum.TV, 240, -100);
			
			init = true;
		}
			
		for (item in roomObjects)
		{
			if (item.roomObject.id == RoomObjectEnum.TABLE)
			{
				item.moveable = false;
				item.onDropEvent = onItemDrop;
			}
		}
		
		if (_previousLevel == null)
			_previousLevel = LD.levels.getLevel(8);
			
		if (_nextLevel == null)
			_nextLevel = LD.levels.getLevel(10);
			
		if(!roomComplete)
			LD.world.setRoomText("REPROCESSING PLANT");
		else
			LD.world.setRoomText("ROOM COMPLETE!");
	}
	
	public function onItemDrop(item:RoomObjectEntity)
	{
		if (!item.on && item.collideWith(recycler, item.x, item.y) != null && !recycler.on)
		{
			Actuate.timer(1.0).onComplete(onItemProcessed, [item]);
			
			item.visible = false;
			recycler.toggleSwitch(false);
		}
	}
	
	function onItemProcessed(item:RoomObjectEntity)
	{
		if (item.on && item.toggleState.id == RoomObjectEnum.BAR_GREEN)
		{
			item.roomObject = LD.getRoomObject(RoomObjectEnum.PLANT);
			item.toggleSwitch(false);
		}
		else
		{
			if (item.roomObject.id == RoomObjectEnum.STAR)
				item.roomObject = LD.getRoomObject(RoomObjectEnum.TELEPHONE);
			
			if (item.roomObject.id == RoomObjectEnum.TELEPHONE)
				item.roomObject = LD.getRoomObject(RoomObjectEnum.PASS_CARD);
			
			if (item.roomObject.id == RoomObjectEnum.PASS_CARD)
				item.roomObject = LD.getRoomObject(RoomObjectEnum.LAMP_ON);
				
			if (item.roomObject.id == RoomObjectEnum.LAMP_ON)
				item.roomObject = LD.getRoomObject(RoomObjectEnum.TV);
				
			if (item.roomObject.id == RoomObjectEnum.TV)
				item.roomObject = LD.getRoomObject(RoomObjectEnum.STAR);
			
			if (item.roomObject.id == RoomObjectEnum.BROKEN_TV)
				item.roomObject = LD.getRoomObject(RoomObjectEnum.TV);
				
			item.on = true;
			item.toggleSwitch(false);
		}
			
		item.visible = true;
		recycler.toggleSwitch(false);
			
		item.x = recycler.x - 25 + Math.random() * 50;
		item.y = recycler.y + Math.random() * 20;
		item.drop();
		
		if (tasksCompleted == 0 && item.roomObject.id == RoomObjectEnum.STAR)
			tasksCompleted = 1;
		if (tasksCompleted == 1 && item.roomObject.id == RoomObjectEnum.TV)
			tasksCompleted = 2;
		if (tasksCompleted == 2 && item.roomObject.id == RoomObjectEnum.LAMP_ON)
			tasksCompleted = 3;
		if (tasksCompleted == 3 && item.roomObject.id == RoomObjectEnum.PASS_CARD)
			tasksCompleted = 4;
		if (tasksCompleted == 4 && item.roomObject.id == RoomObjectEnum.TELEPHONE)
			tasksCompleted = 5;
			
		if (tasksCompleted == 0)
			LD.world.setRoomText("MAKE ME A STAR!");
		if (tasksCompleted == 1)
			LD.world.setRoomText("MAKE ME A TV!");
		if (tasksCompleted == 2)
			LD.world.setRoomText("MAKE ME A LAMP!");
		if (tasksCompleted == 3)
			LD.world.setRoomText("MAKE ME A PASS CARD!");
		if (tasksCompleted == 4)
			LD.world.setRoomText("MAKE ME A TELEPHONE!");
			
		if (tasksCompleted == 5)
		{			
			roomComplete = true;
			LD.world.setRoomText("ROOM COMPLETE!");
			LD.playSoundEffect(AudioEnum.PICKUP_COIN);
		}
		
		itemConversions++;
	}
}