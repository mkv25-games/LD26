package player;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;
import net.mkv25.ld26.dbvos.ArtworkRow;
import net.mkv25.ld26.enums.ArtworkEnum;

class PlayerEntity extends Entity 
{
	var spritemap:Spritemap;
	
	public function new() 
	{
		super();
		
		var artwork:ArtworkRow =  LD.data.ARTWORK.getRowCast(ArtworkEnum.EXPLORER);
		spritemap = new Spritemap(artwork.path, artwork.width, artwork.height);
		
		spritemap.add("look_left", [0, 1, 2, 3, 4, 5, 6, 7], 12, true);
		spritemap.add("walk", [8, 9, 10, 11, 12, 13, 14, 15], 12, true);
		spritemap.play("look_left");
		
		x = 200;
		y = 200;
		
		addGraphic(spritemap);
	}
	
}