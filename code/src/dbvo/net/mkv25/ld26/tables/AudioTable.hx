package net.mkv25.ld26.tables;

import net.mkv25.ld26.interfaces.*;
import net.mkv25.ld26.dbvos.AudioRow;

class AudioTable implements IDBVOTable
{
	public var dbvos(get, set):IDBVOsModel;
	var _dbvos:IDBVOsModel;

	public var rowList(get, never):Array<IDBVORow>;
	var _rowList:Array<AudioRow>;
	
	public var rowType(get, never):String;
	public var tableName(get, never):String;

	public function new(dbvos:IDBVOsModel)
	{
		_dbvos = dbvos;
	}

	public function init():AudioTable
	{
		_rowList = new Array<AudioRow>();

		// code generated list of all rows
		var row0:AudioRow = cast index(new AudioRow(dbvos).init(0, "Blip Select", "sfx/Blip_Select.mp3"));
		var row1:AudioRow = cast index(new AudioRow(dbvos).init(1, "Bloople", "sfx/Bloople.mp3"));
		var row2:AudioRow = cast index(new AudioRow(dbvos).init(2, "Bounce", "sfx/Bounce.mp3"));
		var row3:AudioRow = cast index(new AudioRow(dbvos).init(3, "Deung", "sfx/Dueng.mp3"));
		var row4:AudioRow = cast index(new AudioRow(dbvos).init(4, "Dupe", "sfx/Dupe.mp3"));
		var row5:AudioRow = cast index(new AudioRow(dbvos).init(5, "Explosion", "sfx/Explosion.mp3"));
		var row6:AudioRow = cast index(new AudioRow(dbvos).init(6, "Pewt", "sfx/Pewt.mp3"));
		var row7:AudioRow = cast index(new AudioRow(dbvos).init(7, "Pickup Coin", "sfx/Pickup_Coin.mp3"));
		var row8:AudioRow = cast index(new AudioRow(dbvos).init(8, "Piew", "sfx/Piew.mp3"));
		var row9:AudioRow = cast index(new AudioRow(dbvos).init(9, "Ping Blip", "sfx/Ping Blip.mp3"));
		var row10:AudioRow = cast index(new AudioRow(dbvos).init(10, "Powerup", "sfx/Powerup.mp3"));
		var row11:AudioRow = cast index(new AudioRow(dbvos).init(11, "Scream Explode", "sfx/Scream Explode.mp3"));
		var row12:AudioRow = cast index(new AudioRow(dbvos).init(12, "Squeel", "sfx/Squeel.mp3"));
		var row13:AudioRow = cast index(new AudioRow(dbvos).init(13, "Thuck", "sfx/Thuck.mp3"));
		var row14:AudioRow = cast index(new AudioRow(dbvos).init(14, "Thuckle", "sfx/Thuckle.mp3"));
			
		return this;
	}

	public function index(row:IDBVORow):IDBVORow
	{
		row.dbvos = dbvos;
		_rowList.push(cast row);
		return row;
	}
		
	public function get_dbvos():IDBVOsModel
	{
		return _dbvos;
	}
		
	public function set_dbvos(value:IDBVOsModel):IDBVOsModel
	{
		return _dbvos = value;
	}
		
	public function get_tableName():String
	{
		return "Audio";
	}
		
	public function get_rowList():Array<IDBVORow>
	{
		var _typedList = new Array<IDBVORow>();
		for(item in _rowList)
		{
			_typedList.push(item);
		}
		return _typedList;
	}

	public function get_rowType():String
	{
		return "AudioRow";
	}
		
	public function getRow(id:Int):IDBVORow
	{
		for(row in rowList)
		{
			if(row.id == id)
				return row;
		}
		return null;
	}
		
	public function getRowCast(id:Int):AudioRow
	{
		return cast getRow(id);
	}
}
