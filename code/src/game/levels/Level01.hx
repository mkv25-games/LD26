package levels;

import api.ILevel;
import com.haxepunk.Scene;
import net.mkv25.ld26.dbvos.RoomObjectRow;
import net.mkv25.ld26.enums.RoomObjectEnum;
import world.MinimalistWorld;

class Level01 extends BaseLevel implements ILevel
{
	var tv:RoomObjectEntity;
	var table:RoomObjectEntity;
	var lamp:RoomObjectEntity;
	
	public function start(world:Scene):Void
	{
		this.world = world;
		tv = addRoomObject(RoomObjectEnum.TV, -200, 5);
		table = addRoomObject(RoomObjectEnum.TABLE, 100, -60);
		lamp = addRoomObject(RoomObjectEnum.LAMP, 250, -50);
		
		if (_nextLevel == null)
			_nextLevel = new Level01();
	}
}