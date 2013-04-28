package net.mkv25.ld26.tables;

import net.mkv25.ld26.interfaces.*;
import net.mkv25.ld26.dbvos.ArtworkRow;

class ArtworkTable implements IDBVOTable
{
	public var dbvos(get, set):IDBVOsModel;
	var _dbvos:IDBVOsModel;

	public var rowList(get, never):Array<IDBVORow>;
	var _rowList:Array<ArtworkRow>;
	
	public var rowType(get, never):String;
	public var tableName(get, never):String;

	public function new(dbvos:IDBVOsModel)
	{
		_dbvos = dbvos;
	}

	public function init():ArtworkTable
	{
		_rowList = new Array<ArtworkRow>();

		// code generated list of all rows
		var row0:ArtworkRow = cast index(new ArtworkRow(dbvos).init(0, "No Artwork", "", 0, 0));
		var row1:ArtworkRow = cast index(new ArtworkRow(dbvos).init(1, "Explorer", "gfx/explorer_x128.png", 128, 128));
		var row2:ArtworkRow = cast index(new ArtworkRow(dbvos).init(2, "Room", "gfx/room.png", 800, 400));
		var row3:ArtworkRow = cast index(new ArtworkRow(dbvos).init(3, "Stuff", "gfx/stuff.png", 64, 64));
		var row4:ArtworkRow = cast index(new ArtworkRow(dbvos).init(4, "Final Boss", "gfx/final_boss.png", 256, 256));
		var row7:ArtworkRow = cast index(new ArtworkRow(dbvos).init(7, "Title Screen", "gfx/title_page.png", 800, 400));
		var row10:ArtworkRow = cast index(new ArtworkRow(dbvos).init(10, "Game Over Screen", "gfx/game_over_page.png", 800, 400));
			
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
		return "Artwork";
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
		return "ArtworkRow";
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
		
	public function getRowCast(id:Int):ArtworkRow
	{
		return cast getRow(id);
	}
}
