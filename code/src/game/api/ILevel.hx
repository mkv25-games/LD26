package api;
import com.haxepunk.Scene;
import levels.RoomObjectEntity;

interface ILevel 
{
	function start(world:Scene):Void;
	function update():Void;
	function exit():Void;
	function nextLevel():Void;
	function previousLevel():Void;
	function nextAvailable():Bool;
	function previousAvailable():Bool;
	
	var roomComplete:Bool;
	var roomObjects:List<RoomObjectEntity>;
}