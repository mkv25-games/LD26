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
	
	public function start(world:Scene):Void
	{
		this.world = world;
		
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
			if (i != 10)
			{
				if (level.roomComplete == false)
				{
					LD.world.setRoomText("GO BACK, ROOM " + i + " IS INCOMPLETE.");
					cheesecake = false;
					break;
				}
			}
			i++;
		}
		
		if (cheesecake)
		{
			LD.world.setRoomText("YOU HAVE BESTED ME! YOU MAY LEAVE NOW");
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