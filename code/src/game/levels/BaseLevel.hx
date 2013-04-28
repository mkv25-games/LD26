package levels;

import api.ILevel;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.graphics.Stamp;
import com.haxepunk.Scene;

class BaseLevel 
{
	var world:Scene;
	var roomObjects:List<RoomObjectEntity>;
	
	var _nextLevel:ILevel;
	var _previousLevel:ILevel;
	
	public function new() 
	{
		roomObjects = new List<RoomObjectEntity>();
	}
	
	public function addRoomObject(id:Int, x:Int, y:Int):RoomObjectEntity
	{
		var entity = new RoomObjectEntity(id);
		entity.x = x;
		entity.y = y;
		entity.layer = 1000 - y;
		world.add(entity);
		roomObjects.push(entity);
		return entity;
	}
	
	public function nextLevel():Void
	{
		LD.world.changeLevel(_nextLevel);
	}
	
	public function previousLevel():Void
	{
		LD.world.changeLevel(_previousLevel);
	}
	
	public function exit():Void
	{
		for (item in roomObjects)
		{
			world.remove(item);
		}
	}
}