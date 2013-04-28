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
		tv = addRoomObject(RoomObjectEnum.TV, -200, -50);
		table = addRoomObject(RoomObjectEnum.TABLE, 100, -50);
		lamp = addRoomObject(RoomObjectEnum.LAMP, 250, -50);
		
	}
}