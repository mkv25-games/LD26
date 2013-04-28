package levels;

import api.ILevel;
import com.haxepunk.Scene;
import net.mkv25.ld26.dbvos.RoomObjectRow;
import net.mkv25.ld26.enums.AudioEnum;
import net.mkv25.ld26.enums.RoomObjectEnum;
import world.MinimalistWorld;

class Level06 extends BaseLevel implements ILevel
{
	public var votingBox:RoomObjectEntity;
	
	var table1:RoomObjectEntity;
	var telephone:RoomObjectEntity;
	var table2:RoomObjectEntity;
	var star:RoomObjectEntity;
	
	var starPower:Int = 0;
	
	public function start(world:Scene):Void
	{
		this.world = world;
		table1 = addRoomObject(table1, RoomObjectEnum.TABLE, 150, -60);
		telephone = addRoomObject(telephone, RoomObjectEnum.TELEPHONE, 150, -100);
		table2 = addRoomObject(table2, RoomObjectEnum.TABLE, -150, -60);
		star = addRoomObject(star, RoomObjectEnum.STAR, -150, -100);
		votingBox = addRoomObject(votingBox, RoomObjectEnum.BOX, 0, 0);
		
		star.onDroppedEvent = onStarDropped;
		
		table1.moveable = table2.moveable = false;
		votingBox.moveable = false;
		votingBox.toggleState = LD.getRoomObject(RoomObjectEnum.CARD_MACHINE_ON);
		
		if (_previousLevel == null)
			_previousLevel = LD.levels.getLevel(5);
			
		if (_nextLevel == null)
			_nextLevel = LD.levels.getLevel(7);
			
		if(!roomComplete)
			LD.world.setRoomText("MAKE IT SHINE");
		else
			LD.world.setRoomText("ROOM COMPLETE!");
	}
	
	function onStarDropped()
	{
		starPower++;
		var starType:RoomObjectRow = star.toggleState;
		if (starPower == 1)
			starType = LD.getRoomObject(RoomObjectEnum.STAR_LEVEL_1);
		if (starPower == 2)
			starType = LD.getRoomObject(RoomObjectEnum.STAR_LEVEL_2);
		if (starPower == 3)
			starType = LD.getRoomObject(RoomObjectEnum.STAR_LEVEL_3);
		if (starPower == 4)
			starType = LD.getRoomObject(RoomObjectEnum.STAR_LEVEL_4);
		if (starPower == 5)
			starType = LD.getRoomObject(RoomObjectEnum.STAR_LEVEL_5);
			
		star.toggleState = starType;
		star.on = false;
		star.toggleSwitch(false);
		
		if (starPower == 5)
		{
			roomComplete = true;
			LD.world.setRoomText("ROOM COMPLETE!");
			LD.playSoundEffect(AudioEnum.PICKUP_COIN);
		}
	}
}