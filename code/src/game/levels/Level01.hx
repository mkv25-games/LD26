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
		left = addRoomObject(left, RoomObjectEnum.LEFT_ARROW, -200, -30);
		space = addRoomObject(space, RoomObjectEnum.SPACE_BAR, 0, -80);
		right = addRoomObject(right, RoomObjectEnum.RIGHT_ARROW, 200, -30);

		left.moveable = true;
		right.moveable = true;
		
		if (_nextLevel == null)
			_nextLevel = LD.levels.getLevel(2);
	}
}