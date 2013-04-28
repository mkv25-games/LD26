package levels;

import api.ILevel;
import com.haxepunk.Scene;
import net.mkv25.ld26.dbvos.RoomObjectRow;
import net.mkv25.ld26.enums.RoomObjectEnum;
import world.MinimalistWorld;

class Level01 extends BaseLevel implements ILevel
{
	var left:RoomObjectEntity;
	var right:RoomObjectEntity;
	var space:RoomObjectEntity;
	var up:RoomObjectEntity;
	var down:RoomObjectEntity;
	
	public function start(world:Scene):Void
	{
		this.world = world;
		left = addRoomObject(left, RoomObjectEnum.LEFT_ARROW, -200, -45);
		right = addRoomObject(right, RoomObjectEnum.RIGHT_ARROW, -100, -45);
		space = addRoomObject(space, RoomObjectEnum.SPACE_BAR, 0, -120);
		up = addRoomObject(up, RoomObjectEnum.UP_ARROW, 100, -45);
		down = addRoomObject(down, RoomObjectEnum.DOWN_ARROW, 200, -45);

		left.moveable = true;
		right.moveable = true;
		space.moveable = false;
		up.moveable = true;
		down.moveable = true;
		
		if (_nextLevel == null)
			_nextLevel = LD.levels.getLevel(2);
			
		LD.world.setRoomText("INSTRUCTION ROOM");
	}
}