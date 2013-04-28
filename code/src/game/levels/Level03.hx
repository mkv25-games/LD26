package levels;

import api.ILevel;
import com.haxepunk.Scene;
import net.mkv25.ld26.dbvos.RoomObjectRow;
import net.mkv25.ld26.enums.AudioEnum;
import net.mkv25.ld26.enums.RoomObjectEnum;
import world.MinimalistWorld;

class Level03 extends BaseLevel implements ILevel
{
	var table1:RoomObjectEntity;
	var tv:RoomObjectEntity;
	var lightSwitch:RoomObjectEntity;
	var table2:RoomObjectEntity;
	var lamp:RoomObjectEntity;
	
	var tvBroken:Bool = false;
	var lampLit:Bool = false;
	
	public function start(world:Scene):Void
	{
		this.world = world;
		table1 = addRoomObject(table1, RoomObjectEnum.TABLE, 150, -60);
		tv = addRoomObject(tv, RoomObjectEnum.TV, 150, -100);
		lightSwitch = addRoomObject(lightSwitch, RoomObjectEnum.LIGHT_SWITCH_OFF, 0, -120); 
		table2 = addRoomObject(table2, RoomObjectEnum.TABLE, -150, -60);
		lamp = addRoomObject(lamp, RoomObjectEnum.LAMP_OFF, -150, -100);
		
		tv.onDroppedEvent = onTVDropped;
		tv.toggleState = LD.getRoomObject(RoomObjectEnum.BROKEN_TV);
		
		table1.moveable = table2.moveable = false;
		
		lightSwitch.moveable = false;
		lightSwitch.switchable = true;
		lightSwitch.toggleState = LD.getRoomObject(RoomObjectEnum.LIGHT_SWITCH_ON);
		lightSwitch.onToggleEvent = onLampToggle;
		
		lamp.toggleState = LD.getRoomObject(RoomObjectEnum.LAMP_ON);
		lamp.onDroppedEvent = onLampToggle;
		
		if (_previousLevel == null)
			_previousLevel = LD.levels.getLevel(2);
			
		if (_nextLevel == null)
			_nextLevel = LD.levels.getLevel(4);
			
		if(!roomComplete)
			LD.world.setRoomText("CODERS LOUNGE");
		else
			LD.world.setRoomText("ROOM COMPLETE!");
	}
	
	function onTVDropped(entity:RoomObjectEntity)
	{
		if (tv.on)
			return;
			
		tv.toggleSwitch();
		tvBroken = true;
		
		checkRoomCompletion();
	}
	
	function onLampToggle(entity:RoomObjectEntity)
	{
		if (roomContains(RoomObjectEnum.LIGHT_SWITCH_ON))
		{
			// cool
			lamp.toggleSwitch();
			lampLit = lamp.on;
		}
		else
		{
			// not cool
			if(lamp.on)
				lamp.toggleSwitch();
			lampLit = false;
		}
		
		checkRoomCompletion();
	}
	
	function checkRoomCompletion()
	{
		if (tvBroken && !lampLit)
		{
			LD.world.setRoomText("BROKEN CODERS LOUNGE");
		}
		else if (tvBroken && lampLit)
		{
			LD.world.setRoomText("BRIGHT AND BROKEN CODERS LOUNGE");
		}
		else if (!tvBroken && lampLit)
		{
			LD.world.setRoomText("ROOM COMPLETE!");
			LD.playSoundEffect(AudioEnum.PICKUP_COIN);
			roomComplete = true;
		}
	}
}