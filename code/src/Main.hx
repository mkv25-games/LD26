import com.haxepunk.Engine;
import com.haxepunk.HXP;
import game.world.MinimalistWorld;

class Main extends Engine
{

	override public function init()
	{
		#if debug
		HXP.console.enable();
		#end
		
		HXP.scene = new MinimalistWorld();
	}

	public static function main() { new Main(); }

}