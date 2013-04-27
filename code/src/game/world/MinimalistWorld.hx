package world;

import com.haxepunk.Scene;
import player.PlayerEntity;

class MinimalistWorld extends Scene
{
	public function new() 
	{
		super();
	}
	
	override public function begin()
	{
		add(new PlayerEntity());
	}
}