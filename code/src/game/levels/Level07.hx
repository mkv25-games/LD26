package levels;

import api.ILevel;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import net.mkv25.ld26.dbvos.RoomObjectRow;
import net.mkv25.ld26.enums.AudioEnum;
import net.mkv25.ld26.enums.RoomObjectEnum;
import world.MinimalistWorld;

class Level07 extends BaseLevel implements ILevel
{
	var xobj:RoomObjectEntity;
	var yobj:RoomObjectEntity;
	var zobj:RoomObjectEntity;
	
	public function start(world:Scene):Void
	{
		this.world = world;
		xobj = addRoomObject(xobj, RoomObjectEnum.PLANT, -150, 0);
		yobj = addRoomObject(yobj, RoomObjectEnum.PLANT, 0, -50);
		zobj = addRoomObject(zobj, RoomObjectEnum.PLANT, 150, 0);
		
		if (_previousLevel == null)
			_previousLevel = LD.levels.getLevel(6);
			
		if (_nextLevel == null)
			_nextLevel = LD.levels.getLevel(8);
		
		if(!roomComplete)
			LD.world.setRoomText("HYDROPONICS ROOM - 60% EFFICIENCY");
		else
			LD.world.setRoomText("ROOM COMPLETE!");
	}
	
	override public function update() 
	{
		if (roomComplete)
			return;
		
		var plantCount:Int = 0;
		for (item in roomObjects)
		{
			if (item.roomObject.id == RoomObjectEnum.PLANT && item != LD.world.player.carryObject)
			{
				plantCount++;
			}
		}
		
		if (plantCount == 6)
		{
			roomComplete = true;
			LD.world.setRoomText("ROOM COMPLETE!");
			LD.playSoundEffect(AudioEnum.PICKUP_COIN);
		}
		else
		{
			var perc = HXP.round(plantCount / 6, 2);
			LD.world.setRoomText("HYDROPONICS ROOM - " + (perc * 100) + "% EFFICIENT");
		}
	}
}