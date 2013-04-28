package levels;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.HXP;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import motion.Actuate;
import motion.easing.Quad;
import motion.easing.Sine;
import net.mkv25.ld26.dbvos.RoomObjectRow;
import net.mkv25.ld26.enums.AudioEnum;

class RoomObjectEntity extends Entity 
{
	public var roomObject:RoomObjectRow;
	public var moveable:Bool;
	public var switchable:Bool;
	public var on:Bool;
	public var beingCarried:Bool;
	
	var spritemap:Spritemap;
	
	public function new(id:Int) 
	{
		super();
		
		roomObject = LD.getRoomObject(id);
		moveable = true;
		switchable = false;
		on = false;
		beingCarried = false;
		
		var artwork = roomObject.artwork;
		spritemap = new Spritemap(artwork.path, artwork.width, roomObject.artwork.height);
		spritemap.frame = roomObject.artIndex;
		
		spritemap.centerOrigin();
		centerOrigin();
		
		addGraphic(spritemap);
		setHitbox(spritemap.width, spritemap.height, cast spritemap.originX, cast spritemap.originY);
		
		type = "room_object";
	}
	
	override public function update():Void 
	{
		super.update();
		
		if (beingCarried)
			return;
		
		if (collide("player", x, y) != null)
		{
			LD.world.setMessageText(roomObject.description);
			
			if (Input.pressed(Key.SPACE))
			{
				if (moveable)
				{
					pickup();
				}
				if (switchable)
				{
					toggleSwitch();
				}
			}
		}
	}
	
	function pickup()
	{
		if (LD.world.player.tryPickUp(this))
		{
			spritemap.angle = 25;
			LD.playSoundEffect(roomObject.pickupSoundId);
		}
	}
	
	public function drop()
	{
		y = LD.world.player.y;
		layer = cast 1000 - y;
		spritemap.angle = 0;
		Actuate.tween(spritemap, 0.3, { angle: 360 } ).ease(Sine.easeInOut);
		Actuate.tween(this, 0.3, { y: y - 110 } ).ease(Sine.easeInOut).reverse().onComplete(onDropped);
		Actuate.tween(this, 0.3, { x: x + (100 * LD.world.player.direction * -1) } ).ease(Quad.easeOut);
		
		LD.playSoundEffect(AudioEnum.BOUNCE);
	}
	
	function onDropped()
	{
		LD.playSoundEffect(AudioEnum.THUCKLE);
	}
	
	public function toggleSwitch()
	{
		on = !on;
	}
	
}