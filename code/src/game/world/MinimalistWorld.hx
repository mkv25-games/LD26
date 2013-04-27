package world;

import com.haxepunk.graphics.Stamp;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import net.mkv25.ld26.enums.ArtworkEnum;
import player.PlayerEntity;

class MinimalistWorld extends Scene
{
	public function new() 
	{
		super();
	}
	
	override public function begin()
	{
		camera.x = - HXP.stage.stageWidth / 2;
		camera.y = -HXP.stage.height + 100;
		
		var roomArtwork = LD.data.ARTWORK.getRowCast(ArtworkEnum.ROOM);
		addGraphic(new Stamp(roomArtwork.path, cast - roomArtwork.width / 2, cast - roomArtwork.height + 100));
		
		add(new PlayerEntity());
	}
}