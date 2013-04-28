package player;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Stamp;
import com.haxepunk.HXP;
import net.mkv25.ld26.enums.ArtworkEnum;

class FinalBossEntity extends Entity
{
	var bounceTime:Float = 0;
	
	public function new() 
	{
		super();
		
		var artwork = LD.data.ARTWORK.getRowCast(ArtworkEnum.FINAL_BOSS);
		var stamp = new Image(artwork.path);
		
		stamp.centerOrigin();
		addGraphic(stamp);
	}
	
	override public function update():Void 
	{
		bounceTime = bounceTime + HXP.elapsed * HXP.frameRate * 0.3;
		if (bounceTime > LD.sineCurve.length)
			bounceTime = 0;
		y = -150 - 100 * LD.sineCurve[cast bounceTime % LD.sineCurve.length];
	}
	
}