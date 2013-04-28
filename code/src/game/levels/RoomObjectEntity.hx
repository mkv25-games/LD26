package levels;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;
import net.mkv25.ld26.dbvos.RoomObjectRow;

class RoomObjectEntity extends Entity 
{
	var roomObject:RoomObjectRow;
	
	public function new(id:Int) 
	{
		super();
		
		var roomObject = LD.getRoomObject(id);
		var graphic = new Spritemap(roomObject.artwork.path, roomObject.artwork.width, roomObject.artwork.height);
		graphic.frame = roomObject.artIndex;
		
		addGraphic(graphic);
		graphic.centerOrigin();
	}
	
}