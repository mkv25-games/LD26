package levels;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.graphics.Stamp;
import com.haxepunk.Scene;

class BaseLevel 
{
	var world:Scene;
	var roomObjects:List<RoomObjectEntity>;
	
	public function new() 
	{
		roomObjects = new List<RoomObjectEntity>();
	}
	
	public function addRoomObject(id:Int, x:Int, y:Int):RoomObjectEntity
	{
		var entity = new RoomObjectEntity(id);
		entity.x = x;
		entity.y = y;
		world.add(entity);
		roomObjects.push(entity);
		return entity;
	}
	
	public function exit()
	{
		for (item in roomObjects)
		{
			world.remove(item);
		}
	}
}