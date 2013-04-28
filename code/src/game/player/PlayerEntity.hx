package player;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.HXP;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import net.mkv25.ld26.dbvos.ArtworkRow;
import net.mkv25.ld26.enums.ArtworkEnum;
import nme.geom.Point;

class PlayerEntity extends Entity 
{
	var spritemap:Spritemap;
	var velocity:Point;
	var acceleration:Point;
	var sitDown:Bool;
	var standingUp:Bool;
	
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
		spritemap.y = - spritemap.height + 30;
		spritemap.x = - spritemap.width / 2;
		
		velocity = new Point();
		acceleration = new Point();
		sitDown = false;
		y = -20;
		
		addGraphic(spritemap);
	}
	
	public function idle()
	{
		spritemap.play("idle");
	}
	
	public function playerUpdate():Void 
	{
		var gravity = 1.0;
		velocity.x = velocity.x * 0.5;
		velocity.y = velocity.y * 0.5;
		if (Math.abs(velocity.x) < 0.1) velocity.x = 0;
		if (Math.abs(velocity.y) < 0.1) velocity.y = 0;
		
		acceleration.x = 0.0;
		acceleration.y = HXP.clamp(acceleration.y + 5, -100, 10);
		layer = cast 1000 - y;
		
		if (Input.check(Key.DOWN))
		{
			sitDown = true;
		}
		else if (sitDown)
		{
			standingUp = true;
			sitDown = false;
		}
		else if (Input.check(Key.LEFT))
		{
			acceleration.x = -3;
		}
		else if (Input.check(Key.RIGHT))
		{
			acceleration.x = 3;
		}
		
		if (!standingUp && !sitDown)
		{
			velocity.x = HXP.clamp(velocity.x + acceleration.x, -10.0, 10.0);
			velocity.y = HXP.clamp(velocity.y + acceleration.y + gravity, -100, 100);
		}
		
		if (sitDown)
		{
			spritemap.play("sit");
		}
		else if (standingUp)
		{
			spritemap.play("stand");
			if (spritemap.frame == 7)
				standingUp = false;
		}
		else
		{
			if (velocity.x > 0)
			{
				spritemap.play("walk");
				spritemap.scaleX = 1.0;
				spritemap.x = - spritemap.width / 2;
			}
			else if (velocity.x < 0)
			{
				spritemap.play("walk");
				spritemap.scaleX = -1.0;
				spritemap.x = spritemap.width / 2;
			}
			else
			{
				spritemap.play("idle");
			}
		}
		
		x = HXP.clamp(x + velocity.x, -400, 400);
		y = -20;
	}
	
}