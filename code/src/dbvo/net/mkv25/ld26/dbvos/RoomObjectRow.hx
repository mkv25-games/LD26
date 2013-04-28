package net.mkv25.ld26.dbvos;

import net.mkv25.ld26.interfaces.*;

class RoomObjectRow implements IDBVORow
{
	public var dbvos(get,set):IDBVOsModel;
	var _dbvos:IDBVOsModel;
		
	// code generated list of variables
	public var name:String;
	public var artworkId:Int;
	public var artIndex:Int;
	public var description:String;
	public var id(get,set):Int;
	var _id:Int;
		
	public function new(dbvos:IDBVOsModel)
	{
		_dbvos = dbvos;
	}
		
	public function init(_id:Int, _name:String, _artworkId:Int, _artIndex:Int, _description:String):RoomObjectRow
	{
		// code generated list of params
		id = _id;
		name = _name;
		artworkId = _artworkId;
		artIndex = _artIndex;
		description = _description;
		
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
	public var artwork(get,set):ArtworkRow; // property declaration
	var _artwork:ArtworkRow; // cached lookup value
	function get_artwork():ArtworkRow
	{
		if(_artwork == null)
			_artwork = cast dbvos.retrieve(artworkId, "ArtworkRow");
		return _artwork;
	}
		
	function set_artwork(value:ArtworkRow):ArtworkRow
	{
		// overrides cached value
		return _artwork = value;
	}
		
}
