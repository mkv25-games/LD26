package levels;

import api.ILevel;
import com.haxepunk.Scene;
import net.mkv25.ld26.dbvos.RoomObjectRow;
import net.mkv25.ld26.enums.RoomObjectEnum;
import world.MinimalistWorld;

class Level02 extends BaseLevel implements ILevel
{
	var wp1:RoomObjectEntity;
	var wp2:RoomObjectEntity;
	var wpb:RoomObjectEntity;
	
	public function start(world:Scene):Void
	{
		this.world = world;
		wp1 = addRoomObject(wp1, RoomObjectEnum.WASTE_PAPER_1, -200, 5);
		wp2 = addRoomObject(wp2, RoomObjectEnum.WASTE_PAPER_2, 100, -60);
		wpb = addRoomObject(wpb, RoomObjectEnum.WASTE_BASKET, 150, -50);
		
		if (_previousLevel == null)
			_previousLevel = LD.levels.getLevel(1);
			
		if (_nextLevel == null)
			_nextLevel = LD.levels.getLevel(3);
	}
}