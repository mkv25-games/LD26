package levels;

import api.ILevel;
import com.haxepunk.Scene;
import net.mkv25.ld26.dbvos.RoomObjectRow;
import net.mkv25.ld26.enums.RoomObjectEnum;
import world.MinimalistWorld;

class Level01 extends BaseLevel implements ILevel
{
	var left:RoomObjectEntity;
	var space:RoomObjectEntity;
	var right:RoomObjectEntity;
	
	public function start(world:Scene):Void
	{
		this.world = world;
		left = addRoomObject(RoomObjectEnum.LEFT_ARROW, -200, -30);
		space = addRoomObject(RoomObjectEnum.SPACE_BAR, 0, -80);
		right = addRoomObject(RoomObjectEnum.RIGHT_ARROW, 200, -30);

		if (_nextLevel == null)
			_nextLevel = LD.levels.getLevel(2);
	}
}