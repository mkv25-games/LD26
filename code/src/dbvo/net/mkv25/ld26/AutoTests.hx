package net.mkv25.ld26;

import net.mkv25.ld26.dbvos.DBVOsModel;
import net.mkv25.ld26.interfaces.IDBVOsModel;
import net.mkv25.ld26.interfaces.IDBVOTable;

class AutoTests
{
	public function new()
	{
		var model:IDBVOsModel = new DBVOsModel();
		for(table in model.tableList)
		{
			trace("Table: " + table.tableName + ", Rows: " + table.rowList.length);
		}
	}		
}
