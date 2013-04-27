package net.mkv25.ld26.dbvos;

import net.mkv25.ld26.interfaces.*;

class ArtworkRow implements IDBVORow
{
	public var dbvos(get,set):IDBVOsModel;
	var _dbvos:IDBVOsModel;
		
	// code generated list of variables
	public var name:String;
	public var path:String;
	public var width:Int;
	public var height:Int;
	public var id(get,set):Int;
	var _id:Int;
		
	public function new(dbvos:IDBVOsModel)
	{
		_dbvos = dbvos;
	}
		
	public function init(_id:Int, _name:String, _path:String, _width:Int, _height:Int):ArtworkRow
	{
		// code generated list of params
		id = _id;
		name = _name;
		path = _path;
		width = _width;
		height = _height;
		
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
