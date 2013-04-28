package levels;

import api.ILevel;
import com.haxepunk.Scene;
import net.mkv25.ld26.dbvos.RoomObjectRow;
import net.mkv25.ld26.enums.AudioEnum;
import net.mkv25.ld26.enums.RoomObjectEnum;
import world.MinimalistWorld;

class Level02 extends BaseLevel implements ILevel
{
	var wp1:RoomObjectEntity;
	var wp2:RoomObjectEntity;
	var wpb:RoomObjectEntity;
	var table:RoomObjectEntity;
	
	var basketCount:Int = 0;
	
	public function start(world:Scene):Void
	{
		this.world = world;
		wp1 = addRoomObject(wp1, RoomObjectEnum.WASTE_PAPER_1, 0, -60);
		wp2 = addRoomObject(wp2, RoomObjectEnum.WASTE_PAPER_2, 200, 5);
		wpb = addRoomObject(wpb, RoomObjectEnum.WASTE_BASKET, -150, -50);
		table = addRoomObject(table, RoomObjectEnum.TABLE, 100, -20);
		
		wp1.moveable = true;
		wp2.moveable = true;
		wpb.moveable = false;
		table.moveable = true;
		
		wp1.onDroppedEvent = onWastePaperDropped;
		wp2.onDroppedEvent = onWastePaperDropped;
		
		if (_previousLevel == null)
			_previousLevel = LD.levels.getLevel(1);
			
		if (_nextLevel == null)
			_nextLevel = LD.levels.getLevel(3);
			
		if(!roomComplete)
			LD.world.setRoomText("MESSY DESIGN ROOM");
		else
			LD.world.setRoomText("ROOM COMPLETE!");
	}
	
	function onWastePaperDropped(entity:RoomObjectEntity)
	{
		if (wp1.collideWith(wpb, wp1.x, wp1.y) != null)
		{
			roomObjects.remove(wp1);
			world.remove(wp1);
			wp1.y = -1000;
			basketCount++;
		}
		
		if (wp2.collideWith(wpb, wp2.x, wp2.y) != null)
		{
			roomObjects.remove(wp2);
			world.remove(wp2);
			wp2.y = -1000;
			basketCount++;
		}
		
		if (basketCount == 1)
		{
			LD.world.setRoomText("TIDIER DESIGN ROOM");
		}
			
		if (basketCount == 2)
		{
			LD.world.setRoomText("ROOM COMPLETE!");
			LD.playSoundEffect(AudioEnum.PICKUP_COIN);
			roomComplete = true;
		}
		
	}
}