package levels;

import api.ILevel;
import com.haxepunk.Scene;
import net.mkv25.ld26.dbvos.RoomObjectRow;
import net.mkv25.ld26.enums.AudioEnum;
import net.mkv25.ld26.enums.RoomObjectEnum;
import world.MinimalistWorld;

class Level04 extends BaseLevel implements ILevel
{
	var plug1:RoomObjectEntity;
	var plug2:RoomObjectEntity;
	var plug3:RoomObjectEntity;
	
	public function start(world:Scene):Void
	{
		this.world = world;
		plug1 = addRoomObject(plug1, RoomObjectEnum.PLUG_OFF, -180, -100);
		plug2 = addRoomObject(plug2, RoomObjectEnum.PLUG_OFF, 0, -100);
		plug3 = addRoomObject(plug3, RoomObjectEnum.PLUG_OFF, 180, -100);
		
		plug1.moveable = plug2.moveable = plug3.moveable = false;
		
		plug1.switchable = true;
		plug1.toggleState = LD.getRoomObject(RoomObjectEnum.PLUG_ON);
		plug1.onToggleEvent = onPlug1Toggle;
		
		plug2.switchable = true;
		plug2.toggleState = LD.getRoomObject(RoomObjectEnum.PLUG_ON);
		plug2.onToggleEvent = onPlug2Toggle;
		
		plug3.switchable = true;
		plug3.toggleState = LD.getRoomObject(RoomObjectEnum.PLUG_ON);
		plug3.onToggleEvent = onPlug3Toggle;
		
		
		if (_previousLevel == null)
			_previousLevel = LD.levels.getLevel(3);
			
		if (_nextLevel == null)
			_nextLevel = LD.levels.getLevel(5);
			
		if(!roomComplete)
			LD.world.setRoomText("ADVANCED SOCKETRY ROOM");
		else
			LD.world.setRoomText("ROOM COMPLETE!");
	}
	
	function onPlug1Toggle(entity:RoomObjectEntity)
	{
		plug3.toggleSwitch(false);
		checkRoomCompletion();
	}
	
	function onPlug2Toggle(entity:RoomObjectEntity)
	{
		plug1.toggleSwitch(false);
		plug2.toggleSwitch(false);
		checkRoomCompletion();
	}
	
	function onPlug3Toggle(entity:RoomObjectEntity)
	{
		plug2.toggleSwitch(false);
		checkRoomCompletion();
	}
	
	function checkRoomCompletion()
	{
		if (roomComplete)
			return;
			
		if (plug1.on && plug2.on && plug3.on)
		{
			LD.world.setRoomText("ROOM COMPLETE!");
			LD.playSoundEffect(AudioEnum.PICKUP_COIN);
			roomComplete = true;
			
			plug1.switchable = false;
			plug2.switchable = false;
			plug3.switchable = false;
		}
	}
}