package api;
import com.haxepunk.Scene;

interface ILevel 
{
	function start(world:Scene):Void;
	function exit():Void;
	function nextLevel():Void;
	function previousLevel():Void;
	function nextAvailable():Bool;
	function previousAvailable():Bool;
}