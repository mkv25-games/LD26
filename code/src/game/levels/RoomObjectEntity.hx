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
	public var toggleState:RoomObjectRow;
	public var onToggleEvent:RoomObjectEntity->Void;
	public var onDropEvent:RoomObjectEntity->Void;
	public var onDroppedEvent:RoomObjectEntity->Void;
	
	var spritemap:Spritemap;
	
	public function new(id:Int) 
	{
		super();
		
		roomObject = toggleState = LD.getRoomObject(id);
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
		setHitbox(50, 50, 25, 25);
		
		type = "room_object";
	}
	
	override public function update():Void 
	{
		super.update();
		
		if (beingCarried)
			return;
		
		if (collide("player", x, y) != null)
		{
			if (on)
				LD.world.setMessageText(toggleState.description);
			else
				LD.world.setMessageText(roomObject.description);
			
			if (Input.pressed(Key.SPACE) && LD.world.player.carryObject == null)
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
		
		if(onDropEvent != null)
			onDropEvent(this);
	}
	
	function onDropped()
	{
		LD.playSoundEffect(AudioEnum.THUCKLE);
		
		if(onDroppedEvent != null)
			onDroppedEvent(this);
	}
	
	public function toggleSwitch(dispatchEvent:Bool=true)
	{
		on = !on;
		
		if (on)
		{
			LD.playSoundEffect(toggleState.pickupSoundId);
			spritemap.frame = toggleState.artIndex;
		}
		else
		{
			LD.playSoundEffect(roomObject.pickupSoundId);
			spritemap.frame = roomObject.artIndex;
		}
		
		if (dispatchEvent)
		{
			if (onToggleEvent != null)
				onToggleEvent(this);
		}
	}
	
}