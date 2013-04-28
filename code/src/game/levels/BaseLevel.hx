package levels;

import api.ILevel;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.graphics.Stamp;
import com.haxepunk.Scene;

class BaseLevel 
{
	var world:Scene;
	
	public var roomObjects:List<RoomObjectEntity>;
	public var roomComplete:Bool;
	
	var _nextLevel:ILevel;
	var _previousLevel:ILevel;
	
	public function new() 
	{
		roomObjects = new List<RoomObjectEntity>();
		roomComplete = false;
	}
	
	public function update()
	{
		// override for custom level conditions
	}
	
	public function addRoomObject(existing:RoomObjectEntity, id:Int, x:Int, y:Int):RoomObjectEntity
	{
		if (existing == null)
		{
			var entity = new RoomObjectEntity(id);
			entity.x = x;
			entity.y = y;
			entity.layer = 1000 - y;
			roomObjects.push(entity);
			return entity;
		}
		
		return existing;
	}
	
	public function nextLevel():Void
	{
		if(_nextLevel != null)
			LD.world.changeLevel(_nextLevel);
	}
	
	public function previousLevel():Void
	{
		if(_previousLevel != null)
			LD.world.changeLevel(_previousLevel);
	}
	
	public function nextAvailable():Bool
	{
		if (_nextLevel != null)
			return true;
		return false;
	}
	
	public function previousAvailable():Bool
	{
		if (_previousLevel != null)
			return true;
		return false;
	}
	
	public function exit():Void
	{
		for (item in roomObjects)
		{
			world.remove(item);
		}
	}
	
	public function roomContains(type:Int):Bool
	{
		for (item in roomObjects)
		{
			if (item.on && item.toggleState.id == type)
				return true;
				
			else if (item.roomObject.id == type)
				return true;
		}
		
		return false;
	}
}