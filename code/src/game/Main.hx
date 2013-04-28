import com.haxepunk.Engine;
import com.haxepunk.HXP;
import world.MinimalistWorld;

class Main extends Engine
{
	public function new()
	{
		super(800, 400, 40, false);
	}

	override public function init()
	{
		#if debug
		HXP.console.enable();
		#end
		
		LD.setup(this);
		HXP.scene = LD.world;
	}

	public static function main() { new Main(); }

}