package net.mkv25.ld26.dbvos;

import net.mkv25.ld26.interfaces.*;

class GlobalRow implements IDBVORow
{
	public var dbvos(get,set):IDBVOsModel;
	var _dbvos:IDBVOsModel;
		
	// code generated list of variables
	public var name:String;
	public var value:Float;
	public var text:String;
	public var id(get,set):Int;
	var _id:Int;
		
	public function new(dbvos:IDBVOsModel)
	{
		_dbvos = dbvos;
	}
		
	public function init(_id:Int, _name:String, _value:Float, _text:String):GlobalRow
	{
		// code generated list of params
		id = _id;
		name = _name;
		value = _value;
		text = _text;
		
		return this;
	}
		
	public function get_dbvos():IDBVOsModel
	{
		return _dbvos;
	}
		
	public function set_dbvos(value:IDBVOsModel):IDBVOsModel
	{
		return _dbvos = value;
	}
		
	public function get_id():Int
	{
		return _id;
	}
		
	public function set_id(value:Int):Int
	{
		return _id = value;
	}

	// code generated list of properties
}
