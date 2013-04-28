package net.mkv25.ld26.tables;

import net.mkv25.ld26.interfaces.*;
import net.mkv25.ld26.dbvos.RoomObjectRow;

class RoomObjectTable implements IDBVOTable
{
	public var dbvos(get, set):IDBVOsModel;
	var _dbvos:IDBVOsModel;

	public var rowList(get, never):Array<IDBVORow>;
	var _rowList:Array<RoomObjectRow>;
	
	public var rowType(get, never):String;
	public var tableName(get, never):String;

	public function new(dbvos:IDBVOsModel)
	{
		_dbvos = dbvos;
	}

	public function init():RoomObjectTable
	{
		_rowList = new Array<RoomObjectRow>();

		// code generated list of all rows
		var row1:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(1, "No object", 0, -1, ""));
		var row2:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(2, "Waste Paper 1", 3, 0, "Scrap paper on the ground"));
		var row3:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(3, "Waste Paper 2", 3, 1, "More of this scrap paper, wasted ideas"));
		var row4:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(4, "Left Arrow", 3, 2, ""));
		var row5:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(5, "Right Arrow", 3, 3, ""));
		var row6:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(6, "Space Bar", 3, 4, ""));
		var row7:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(7, "Waste Basket", 3, 5, ""));
		var row8:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(8, "TV", 3, 6, ""));
		var row9:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(9, "Star", 3, 7, ""));
		var row10:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(10, "Bar", 3, 8, ""));
		var row11:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(11, "Box", 3, 9, ""));
		var row12:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(12, "Lamp", 3, 10, ""));
		var row13:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(13, "Card", 3, 11, ""));
		var row14:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(14, "Plug", 3, 12, ""));
		var row15:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(15, "Switch Off", 3, 13, ""));
		var row16:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(16, "Switch On", 3, 14, ""));
		var row17:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(17, "Table", 3, 15, ""));
		var row19:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(19, "Telephone", 3, 16, ""));
		var row20:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(20, "Plant", 3, 17, ""));
			
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
		return "Room Object";
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
		return "RoomObjectRow";
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
		
	public function getRowCast(id:Int):RoomObjectRow
	{
		return cast getRow(id);
	}
}
