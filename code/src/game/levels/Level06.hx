package levels;

import api.ILevel;
import com.haxepunk.Scene;
import net.mkv25.ld26.dbvos.RoomObjectRow;
import net.mkv25.ld26.enums.RoomObjectEnum;
import world.MinimalistWorld;

class Level06 extends BaseLevel implements ILevel
{
	var xobj:RoomObjectEntity;
	var yobj:RoomObjectEntity;
	var zobj:RoomObjectEntity;
	
	public function start(world:Scene):Void
	{
		this.world = world;
		xobj = addRoomObject(xobj, RoomObjectEnum.LIGHT_SWITCH_OFF, -150, -50);
		yobj = addRoomObject(yobj, RoomObjectEnum.TABLE, 0, 0);
		zobj = addRoomObject(zobj, RoomObjectEnum.TELEPHONE, 150, -50);
		
		if (_previousLevel == null)
			_previousLevel = LD.levels.getLevel(5);
			
		if (_nextLevel == null)
			_nextLevel = LD.levels.getLevel(7);
	}
}