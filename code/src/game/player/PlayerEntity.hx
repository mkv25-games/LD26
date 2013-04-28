package player;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.HXP;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import levels.RoomObjectEntity;
import net.mkv25.ld26.dbvos.ArtworkRow;
import net.mkv25.ld26.enums.ArtworkEnum;
import nme.geom.Point;

class PlayerEntity extends Entity 
{
	var spritemap:Spritemap;
	var velocity:Point;
	var acceleration:Point;
	var pickUp:Bool;
	var standingUp:Bool;
	var carryObject:RoomObjectEntity;
	
	public var direction:Int;
	
	public function new() 
	{
		super();
		
		var artwork:ArtworkRow =  LD.data.ARTWORK.getRowCast(ArtworkEnum.EXPLORER);
		spritemap = new Spritemap(artwork.path, artwork.width, artwork.height);
		
		spritemap.add("idle", [7], 12, true);
		spritemap.add("look_left", [0, 1, 2, 3, 4, 5, 6], 12, true);
		spritemap.add("walk", [8, 9, 10, 11, 12, 13, 14, 15], 12, true);
		spritemap.add("sit", [16, 17, 18, 19], 12, false);
		spritemap.add("stand", [19, 18, 17, 16, 7], 12, false);
		spritemap.play("idle");
		spritemap.x = - spritemap.width / 2;
		spritemap.y = - spritemap.height + 20;
		
		velocity = new Point();
		acceleration = new Point();
		pickUp = false;
		
		addGraphic(spritemap);
		setHitbox(60, 100, 30, 100);
		type = "player";
	}
	
	public function idle()
	{
		spritemap.play("idle");
	}
	
	public function tryPickUp(object:RoomObjectEntity):Bool
	{
		if (carryObject != null)
			return false;
		
		pickUp = true;
		carryObject = object;
		return true;
	}
	
	public function playerUpdate():Void 
	{
		velocity.x = velocity.x * 0.5;
		velocity.y = velocity.y * 0.5;
		if (Math.abs(velocity.x) < 0.1) velocity.x = 0;
		if (Math.abs(velocity.y) < 0.1) velocity.y = 0;
		
		acceleration.x = 0.0;
		acceleration.y = 0.0;
		layer = cast 1000 - y;
		
		if (collide("room_object", x, y) == null)
		{
			LD.world.setMessageText("");
		}
		
		if (Input.check(Key.UP))
		{
			acceleration.y = -1.5;
		}
		else if (Input.check(Key.DOWN))
		{
			acceleration.y = 1.5;
		}
		
		if (Input.check(Key.LEFT))
		{
			acceleration.x = -3;
		}
		else if (Input.check(Key.RIGHT))
		{
			acceleration.x = 3;
		}
		
		if (Input.pressed(Key.SPACE))
		{
			if (!pickUp && carryObject != null)
			{
				dropObject();
			}
		}
		
		if (!standingUp && !pickUp)
		{
			velocity.x = HXP.clamp(velocity.x + acceleration.x, -10.0, 10.0);
			velocity.y = HXP.clamp(velocity.y + acceleration.y, -10.0, 10.0);
		}
		
		if (pickUp)
		{
			spritemap.play("sit");
			if (spritemap.frame == 19)
			{
				pickUp = false;
				standingUp = true;
			}
		}
		else if (standingUp)
		{
			spritemap.play("stand");
			if (spritemap.frame == 7)
				standingUp = false;
		}
		else
		{
			if (velocity.length > 0)
			{
				spritemap.play("walk");
			
				if (velocity.x > 0)
				{
					direction = 1;
					spritemap.x = - spritemap.width / 2;
				}
				else if (velocity.x < 0)
				{
					direction = -1;
					spritemap.x = spritemap.width / 2;
				}
					spritemap.scaleX = direction;
			}
			else
			{
				spritemap.play("idle");
			}
		}
		
		x = HXP.clamp(x + velocity.x, -400, 400);
		y = HXP.clamp(y + velocity.y, -60, 0);
		
		if (carryObject != null)
		{
			carryObject.x = x;
			carryObject.y = y - 50;
			carryObject.layer = this.layer - 1;
		}
	}
	
	function dropObject()
	{
		carryObject.drop();
		carryObject = null;
	}
	
}