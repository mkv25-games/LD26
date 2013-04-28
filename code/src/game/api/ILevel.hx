package api;
import com.haxepunk.Scene;

interface ILevel 
{
	function start(world:Scene):Void;
	function exit():Void;
}