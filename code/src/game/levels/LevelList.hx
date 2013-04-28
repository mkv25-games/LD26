package levels;
import api.ILevel;

class LevelList 
{
	var map:Map<Int, ILevel>;
	var list:List<ILevel>;

	public function new() 
	{
		map = new Map<Int, ILevel>();
		
		map.set(1, new Level01());
		map.set(2, new Level02());
		map.set(3, new Level03());
		map.set(4, new Level04());
		map.set(5, new Level05());
		map.set(6, new Level06());
		map.set(7, new Level07());
		map.set(8, new Level08());
		map.set(9, new Level09());
		map.set(10, new Level10());
	}
	
	public function getLevel(id:Int)
	{
		return map.get(id);
	}
	
	public function getAllLevels():List<ILevel>
	{
		if (list == null)
		{
			list = new List<ILevel>();
			for (item in map)
			{
				list.add(item);
			}
		}
		
		return list;
	}
}