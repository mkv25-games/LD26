package levels;

import api.ILevel;
import com.haxepunk.Scene;
import net.mkv25.ld26.dbvos.RoomObjectRow;
import net.mkv25.ld26.enums.RoomObjectEnum;
import world.MinimalistWorld;

class Level03 extends BaseLevel implements ILevel
{
	var tv:RoomObjectEntity;
	var table:RoomObjectEntity;
	var lamp:RoomObjectEntity;
	
	public function start(world:Scene):Void
	{
		this.world = world;
		tv = addRoomObject(tv, RoomObjectEnum.TV, -200, 5);
		table = addRoomObject(table, RoomObjectEnum.TABLE, 100, -60);
		lamp = addRoomObject(lamp, RoomObjectEnum.LAMP_OFF, 250, -50);
		
		if (_previousLevel == null)
			_previousLevel = LD.levels.getLevel(2);
			
		if (_nextLevel == null)
			_nextLevel = LD.levels.getLevel(4);
	}
}