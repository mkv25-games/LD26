package levels;

import api.ILevel;
import com.haxepunk.Scene;
import motion.Actuate;
import net.mkv25.ld26.dbvos.RoomObjectRow;
import net.mkv25.ld26.enums.AudioEnum;
import net.mkv25.ld26.enums.RoomObjectEnum;
import world.MinimalistWorld;

class Level08 extends BaseLevel implements ILevel
{
	var plant1:RoomObjectEntity;
	var plant2:RoomObjectEntity;
	var table1:RoomObjectEntity;
	var bar1:RoomObjectEntity;
	var table2:RoomObjectEntity;
	var bar2:RoomObjectEntity;
	var table3:RoomObjectEntity;
	var bar3:RoomObjectEntity;
	var bin:RoomObjectEntity;
	
	var barConversions:Int = 0;
	
	public function start(world:Scene):Void
	{
		this.world = world;
		plant1 = addRoomObject(plant1, RoomObjectEnum.PLANT, -150, 0);
		plant2 = addRoomObject(plant2, RoomObjectEnum.PLANT, 150, 0);
		
		table1 = addRoomObject(table1, RoomObjectEnum.TABLE, -180, -60);
		bar1 = addRoomObject(bar1, RoomObjectEnum.BAR, -180, -100);
		
		table2 = addRoomObject(table2, RoomObjectEnum.TABLE, 0, -60);
		bar2 = addRoomObject(bar2, RoomObjectEnum.BAR, 0, -100);
		
		table3 = addRoomObject(table3, RoomObjectEnum.TABLE, 180, -60);
		bar3 = addRoomObject(bar3, RoomObjectEnum.BAR, 180, -100);
		
		bin = addRoomObject(bin, RoomObjectEnum.BOX, 0, 0);
		
		table1.moveable = false;
		table2.moveable = false;
		table3.moveable = false;
		bin.moveable = false;
		
		bar1.toggleState = LD.getRoomObject(RoomObjectEnum.BAR_GREEN);
		bar2.toggleState = LD.getRoomObject(RoomObjectEnum.BAR_GREEN);
		bar3.toggleState = LD.getRoomObject(RoomObjectEnum.BAR_GREEN);
		
		bin.toggleState = LD.getRoomObject(RoomObjectEnum.CARD_MACHINE_ON);
		bar1.onDropEvent = onBarDrop;
		bar2.onDropEvent = onBarDrop;
		bar3.onDropEvent = onBarDrop;
		
		if (_previousLevel == null)
			_previousLevel = LD.levels.getLevel(7);
			
		if (_nextLevel == null)
			_nextLevel = LD.levels.getLevel(9);
			
		if(!roomComplete)
			LD.world.setRoomText("DULL MATERIAL PROCESSING PLANT");
		else
			LD.world.setRoomText("ROOM COMPLETE!");
	}
	
	function onBarDrop(bar:RoomObjectEntity)
	{
		if (!bar.on && bar.collideWith(bin, bar.x, bar.y) != null && !bin.on && bar.roomObject.id == RoomObjectEnum.BAR)
		{
			Actuate.timer(1.0).onComplete(onBarProcessed, [bar]);
			
			bar.visible = false;
			bin.toggleSwitch(false);
		}
		
		if (bar.on)
		{
			var level09:Level09 = cast LD.levels.getLevel(9);
			if (level09 != null && LD.world.currentLevel == level09)
			{
				level09.onItemDrop(bar);
			}
		}
	}
	
	function onBarProcessed(bar:RoomObjectEntity)
	{
		if(!bar.on)
			bar.toggleSwitch(true);
		
		bar.visible = true;
		bin.toggleSwitch(false);
			
		bar.x = cast bin.x + (barConversions * 20);
		bar.y = cast bin.y + 30 * Math.random();
		bar.drop();
		
		barConversions++;
		
		if (barConversions == 3)
		{
			roomComplete = true;
			LD.world.setRoomText("ROOM COMPLETE!");
			LD.playSoundEffect(AudioEnum.PICKUP_COIN);
		}
	}
}