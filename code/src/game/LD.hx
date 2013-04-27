package;
import com.haxepunk.Engine;
import world.MinimalistWorld;
import net.mkv25.ld26.dbvos.DBVOsModel;

class LD 
{
	public static var engine:Engine;
	public static var data:DBVOsModel;
	public static var world:MinimalistWorld;
	public static var sineCurve:Array<Float>;
	
	public static function setup(engine:Engine):Void
	{
		LD.engine = engine;
		LD.measure(function():Void { LD.data = new DBVOsModel(); }, "Setup DBVO Data Model" );
		LD.measure(function():Void { LD.world = new MinimalistWorld(); }, "Setup World" );
		LD.measure(function():Void { generateSineCurve(); }, "Setup Sine Curve" );
	}
	
	static function generateSineCurve():Void
	{
		sineCurve = new Array<Float>();
		for (i in 0...24)
		{
			sineCurve[i] = Math.sin(i / 24 * Math.PI);
		}
	}
	
	public static function measure<T>(f:Void -> T, message:String):T
	{
		var result = f();
		/*
		var start = Timer.stamp();
		var result = f();
		var end = Timer.stamp();
		var time = Math.round((end - start) * 1000) / 1000;
		trace(message + ", " + time + "s");
		*/
		return result;
	}
	
	public static function getGlobal(id:Int)
	{
		var row = data.GLOBAL.getRowCast(id);
		if(row == null)
			throw "Could not find global value with the ID: " + id;
			
		return row.value;
	}
}