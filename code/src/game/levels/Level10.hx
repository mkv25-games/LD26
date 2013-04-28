package levels;

import api.ILevel;
import com.haxepunk.Scene;
import net.mkv25.ld26.dbvos.RoomObjectRow;
import net.mkv25.ld26.enums.RoomObjectEnum;
import player.FinalBossEntity;
import world.MinimalistWorld;

class Level10 extends BaseLevel implements ILevel
{
	public var finalBoss:FinalBossEntity;
	
	var xobj:RoomObjectEntity;
	var yobj:RoomObjectEntity;
	var zobj:RoomObjectEntity;
	
	public function start(world:Scene):Void
	{
		this.world = world;
		xobj = addRoomObject(xobj, RoomObjectEnum.TABLE, -150, 0);
		yobj = addRoomObject(yobj, RoomObjectEnum.LAMP_OFF, 0, -50);
		zobj = addRoomObject(zobj, RoomObjectEnum.TABLE, 150, 0);
		
		if (finalBoss == null)
			finalBoss = new FinalBossEntity();
		world.add(finalBoss);
		
		if (_previousLevel == null)
			_previousLevel = LD.levels.getLevel(9);
			
		if (_nextLevel == null)
			_nextLevel = LD.levels.getLevel(1);
			
		if (!roomComplete)
			checkRoomCompletion();
		else
			LD.world.setRoomText("YOU HAVE BESTED ME! LEAVE NOW");
	}
	
	public function checkRoomCompletion()
	{
		var list = LD.levels.getAllLevels();
		
		var cheesecake = true;
		var i = 1;
		for (level in list)
		{
			if (level.roomComplete == false)
			{
				LD.world.setRoomText("GO BACK, ROOM " + i + " IS INCOMPLETE.");
				cheesecake = false;
				break;
			}
			i++;
		}
		
		if (cheesecake)
		{
			roomComplete = true;
			LD.world.gameComplete = true;
		}
	}
	
	override public function exit():Void 
	{
		super.exit();
		
		world.remove(finalBoss);
	}
}