package app.model.dict
{
	import com.esri.ags.geometry.Polygon;
	
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;

	/**
	 *字段说明 
	 */	
	[Bindable]
	public class DicDepartment
	{
		public static const ALL:DicDepartment = new DicDepartment({PX:'-1',JC:'所有单位',DEPID:'-1',DWMC:"所有单位"});
		public static const TRAFFIC:DicDepartment = new DicDepartment({PX:'2000',JC:'交警',DEPID:'-2',DWMC:"交警"});
		
		public var id:String = "";
		public var label:String = "";
		public var shortName:String = "";
		public var PX:Number;
		public var ZB:Number;
		public var isGisShow:Boolean = true;
		public var isMapShow:Boolean = true;
		
		public var polygon:Polygon;
		
		public function DicDepartment(source:Object)
		{
			this.id = source.DEPID;
			this.PX = Number(source.PX);
			this.ZB = Number(source.ZB);
			this.shortName = (source.JC == undefined)?source.DWMC:source.JC;
			this.label = source.DWMC;
		}
		
		public static var dict:Dictionary = new Dictionary;
		/*public static function get listAll():ArrayCollection
		{
			var arr:Array = new Array;
			for each (var item:DicDepartment in dict)
			{
				arr.push(item);
			}			
			arr.sortOn("PX",Array.NUMERIC,"shortName",Array.CASEINSENSITIVE);
			
			return new ArrayCollection(arr);
		}*/
		public static function get list():ArrayCollection
		{
			var arr:Array = new Array;
			for each (var item:DicDepartment in dict)
			{
				if(item.id != ALL.id)
				{
					arr.push(item);
				}
			}			
			arr.sortOn("PX",Array.NUMERIC,"shortName",Array.CASEINSENSITIVE);
			
			return new ArrayCollection(arr);
		}
		
		public static function get listOverview():ArrayCollection
		{
			var arr:Array = new Array;
			for each (var item:DicDepartment in dict)
			{
				if(item.ZB != 125)
					arr.push(item);
			}			
			arr.push(DicDepartment.TRAFFIC);
			
			arr.sortOn("PX",Array.NUMERIC,"shortName",Array.CASEINSENSITIVE);
			
			return new ArrayCollection(arr);
		}
				
		public static function get listTraffic():ArrayCollection
		{
			var arr:Array = new Array;
			for each (var item:DicDepartment in dict)
			{
				if(item.ZB == 125)
					arr.push(item);
			}			
			
			arr.sortOn("PX",Array.NUMERIC,"shortName",Array.CASEINSENSITIVE);
			
			return new ArrayCollection(arr);
		}
	}
}