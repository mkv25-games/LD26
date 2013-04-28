package levels;

import api.ILevel;
import com.haxepunk.Scene;
import net.mkv25.ld26.dbvos.RoomObjectRow;
import net.mkv25.ld26.enums.RoomObjectEnum;
import world.MinimalistWorld;

class Level05 extends BaseLevel implements ILevel
{
	var xobj:RoomObjectEntity;
	var yobj:RoomObjectEntity;
	var zobj:RoomObjectEntity;
	
	public function start(world:Scene):Void
	{
		this.world = world;
		xobj = addRoomObject(xobj, RoomObjectEnum.LAMP_OFF, -150, 0);
		yobj = addRoomObject(yobj, RoomObjectEnum.PASS_CARD, 0, -50);
		zobj = addRoomObject(zobj, RoomObjectEnum.PLUG_OFF, 150, 0);
		
		zobj.moveable = false;
		
		if (_previousLevel == null)
			_previousLevel = LD.levels.getLevel(4);
			
		if (_nextLevel == null)
			_nextLevel = LD.levels.getLevel(6);
	}
}