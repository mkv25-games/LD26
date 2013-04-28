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
		var row1:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(1, "No object", 0, -1, "", -1));
		var row2:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(2, "Waste Paper 1", 3, 0, "Scrap paper on the ground", 13));
		var row3:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(3, "Waste Paper 2", 3, 1, "More of this scrap paper, wasted ideas", 14));
		var row4:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(4, "Left Arrow", 3, 2, "Stroll to the left", 10));
		var row5:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(5, "Right Arrow", 3, 3, "Stroll to the right", 10));
		var row6:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(6, "Space Bar", 3, 4, "Pick and push and flick and drop and things", 0));
		var row7:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(7, "Waste Basket", 3, 5, "One of those waste paper basket things", 4));
		var row8:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(8, "TV", 3, 6, "One of those old school televisions", 8));
		var row9:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(9, "Star", 3, 7, "A bright shining star", 9));
		var row10:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(10, "Bar", 3, 8, "A dull and uninspiring block", 3));
		var row11:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(11, "Box", 3, 9, "A box that can accept some sort of token", 13));
		var row12:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(12, "Lamp Off", 3, 10, "A lampshade", 14));
		var row13:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(13, "Pass Card", 3, 11, "A pass card", 7));
		var row14:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(14, "Plug Off", 3, 12, "Futuristic plug socket", 2));
		var row15:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(15, "Light Switch On", 3, 13, "Turn the lights on", 8));
		var row16:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(16, "Light Switch Off", 3, 14, "Turn the lights off", 6));
		var row17:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(17, "Table", 3, 15, "A small table", 13));
		var row19:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(19, "Telephone", 3, 16, "Ring ring... ring ring? Sure is lonely in here", 7));
		var row20:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(20, "Plant", 3, 17, "Chlorophyll in action", 12));
		var row21:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(21, "Down Arrow", 3, 18, "Move a little closer", 10));
		var row23:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(23, "Up Arrow", 3, 19, "Move a little further", 10));
		var row24:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(24, "Space Bar Down", 3, 20, "Toggle and tinkle and throw your toys around", 1));
		var row25:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(25, "Broken TV", 3, 21, "Nasty things, destroy them all", 11));
		var row26:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(26, "Star Level 1", 3, 22, "Prettier then the last one", 9));
		var row27:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(27, "Star Level 2", 3, 23, "Shinier then ever", 9));
		var row28:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(28, "Star Level 3", 3, 24, "Glossy in the middle", 9));
		var row29:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(29, "Star Level 4", 3, 25, "Brighter then a baby's bottom", 9));
		var row30:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(30, "Star Level 5", 3, 26, "Blinging!", 9));
		var row31:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(31, "Plug On", 3, 27, "Glowin with arcane energies", 12));
		var row36:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(36, "Bar Green", 3, 28, "A bar made of green, possibly edible", 3));
		var row38:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(38, "Lamp On", 3, 29, "Its turned on if you know what I mean", 4));
		var row40:RoomObjectRow = cast index(new RoomObjectRow(dbvos).init(40, "Card Machine On", 3, 30, "Pass card accepted", 10));
			
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
