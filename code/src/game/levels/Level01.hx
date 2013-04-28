package levels;

import api.ILevel;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import motion.Actuate;
import motion.easing.Sine;
import net.mkv25.ld26.dbvos.RoomObjectRow;
import net.mkv25.ld26.enums.AudioEnum;
import net.mkv25.ld26.enums.RoomObjectEnum;
import world.MinimalistWorld;

class Level01 extends BaseLevel implements ILevel
{
	var left:RoomObjectEntity;
	var right:RoomObjectEntity;
	var space:RoomObjectEntity;
	var up:RoomObjectEntity;
	var down:RoomObjectEntity;
	
	var spacePressed:Bool;
	
	public function start(world:Scene):Void
	{
		this.world = world;
		left = addRoomObject(left, RoomObjectEnum.LEFT_ARROW, -200, -45);
		right = addRoomObject(right, RoomObjectEnum.RIGHT_ARROW, -100, -45);
		space = addRoomObject(space, RoomObjectEnum.SPACE_BAR, 0, -120);
		up = addRoomObject(up, RoomObjectEnum.UP_ARROW, 100, -45);
		down = addRoomObject(down, RoomObjectEnum.DOWN_ARROW, 200, -45);

		spacePressed = false;
		
		left.moveable = true;
		right.moveable = true;
		space.moveable = false;
		up.moveable = true;
		down.moveable = true;
		
		space.switchable = true;
		space.toggleState = LD.getRoomObject(RoomObjectEnum.SPACE_BAR_DOWN);
		space.onToggleEvent = onSpaceToggled;
		
		if (_nextLevel == null)
			_nextLevel = LD.levels.getLevel(2);
		
		if(!roomComplete)
			LD.world.setRoomText("INSTRUCTION ROOM");
		else
			LD.world.setRoomText("ROOM COMPLETE!");
	}
	
	function onSpaceToggled(entity:RoomObjectEntity)
	{
		if (!space.on)
			return;
		
		spacePressed = true;
			
		var list = new List<RoomObjectEntity>();
		list.push(left);
		list.push(right);
		list.push(up);
		list.push(down);
		
		for (item in list)
		{
			Actuate.tween(item, 0.2, { y: item.y - 50 } ).ease(Sine.easeOut).reflect().repeat(1);
		}
		
		Actuate.timer(0.5).onComplete(onBounceComplete);
	}
	
	function onBounceComplete()
	{
		space.toggleSwitch();
	}
	
	override public function update()
	{
		if (!roomComplete)
		{
			var perc = HXP.clamp((LD.world.player.x + 200) / 550, 0, 1.0);
			perc = HXP.round(perc, 1);
			
			if (perc == 1)
			{
				if (spacePressed)
				{
					LD.world.setRoomText("ROOM COMPLETE!");
					LD.playSoundEffect(AudioEnum.PICKUP_COIN);
					roomComplete = true;
				}
				else
				{
					LD.world.setRoomText("PRESS THE BUTTON");
				}
			}
			else
			{
				LD.world.setRoomText("INSTRUCTION ROOM " + (perc * 100) + "%");
			}
		}
	}
}