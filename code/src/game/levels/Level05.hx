package levels;

import api.ILevel;
import com.haxepunk.Scene;
import net.mkv25.ld26.dbvos.RoomObjectRow;
import net.mkv25.ld26.enums.AudioEnum;
import net.mkv25.ld26.enums.RoomObjectEnum;
import world.MinimalistWorld;

class Level05 extends BaseLevel implements ILevel
{
	var table1:RoomObjectEntity;
	var passcard:RoomObjectEntity;
	var table2:RoomObjectEntity;
	var lamp:RoomObjectEntity;
	
	var voteMade:Bool = false;
	
	public function start(world:Scene):Void
	{
		this.world = world;
		table1 = addRoomObject(table1, RoomObjectEnum.TABLE, 150, -60);
		passcard = addRoomObject(passcard, RoomObjectEnum.PASS_CARD, 150, -100);
		table2 = addRoomObject(table2, RoomObjectEnum.TABLE, -150, -60);
		lamp = addRoomObject(lamp, RoomObjectEnum.LAMP_OFF, -150, -100);
		
		table1.moveable = false;
		table2.moveable = false;
		
		lamp.moveable = false;
		lamp.toggleState = LD.getRoomObject(RoomObjectEnum.LAMP_ON);
		lamp.onToggleEvent = onLampToggled;
		
		passcard.onDropEvent = onPasscardDropped;
		
		if (_previousLevel == null)
			_previousLevel = LD.levels.getLevel(4);
			
		if (_nextLevel == null)
			_nextLevel = LD.levels.getLevel(6);
			
		if(!roomComplete)
			LD.world.setRoomText("EXTERNAL DEPFENCIES LOUNGE");
		else
			LD.world.setRoomText("ROOM COMPLETE!");
	}
	
	function onLampToggled(entity:RoomObjectEntity)
	{
		if (lamp.on)
		{
			checkRoomCompletion();
		}
	}
	
	function onPasscardDropped(entity:RoomObjectEntity)
	{
		var level06 = cast LD.levels.getLevel(6);
		if (level06 == null)
			return;
			
		var votingBox:RoomObjectEntity = level06.votingBox;
		if (votingBox == null)
			return;
		
		if (passcard.collideWith(votingBox, passcard.x, passcard.y) != null)
		{
			roomObjects.remove(passcard);
			world.remove(passcard);
			passcard.y = -1000;
			
			if (!votingBox.on)
			{
				votingBox.toggleSwitch(true);
				
				// spawn outta nowhere
				var portableSwitch:RoomObjectEntity = LD.world.currentLevel.addRoomObject(null, RoomObjectEnum.PLUG_OFF, cast LD.world.player.x, cast LD.world.player.y);
				portableSwitch.drop();
				portableSwitch.switchable = true;
				portableSwitch.toggleState = LD.getRoomObject(RoomObjectEnum.PLUG_ON);
				portableSwitch.toggleSwitch(false);
				portableSwitch.onToggleEvent = onPortableSwitchToggled;
				world.add(portableSwitch);
			}
				
			voteMade = true;
			
			checkRoomCompletion();
		}
	}
	
	function checkRoomCompletion()
	{
		if (roomComplete)
			return;
			
		if (lamp.on && voteMade)
		{
			roomComplete = true;
			LD.world.setRoomText("ROOM COMPLETE!");
			LD.playSoundEffect(AudioEnum.PICKUP_COIN);
		}
		else if(!voteMade && lamp.on)
		{
			LD.world.setRoomText("VOTE REQUIRED");
		}
		else if (!lamp.on && voteMade)
		{
			LD.world.setRoomText("EXTERNAL POWERSOURCE REQUIRED");
		}
	}
	
	function onPortableSwitchToggled(entity:RoomObjectEntity)
	{
		var items = LD.world.currentLevel.roomObjects;
		for (item in items)
		{
			if (item.roomObject.id == RoomObjectEnum.LAMP_OFF)
			{
				if (!item.on)
					item.toggleSwitch(false);
			}
		}
		
		checkRoomCompletion();
	}
	
}