package com.borhan.vo
{
	import com.borhan.vo.BaseFlexVo;
	[Bindable]
	public dynamic class BorhanMetadataProfileField extends BaseFlexVo
	{
		public var id : int = int.MIN_VALUE;
		public var xPath : String;
		public var key : String;
		public var label : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('id');
			propertyList.push('xPath');
			propertyList.push('key');
			propertyList.push('label');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('id');
			arr.push('xPath');
			arr.push('key');
			arr.push('label');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			return arr;
		}

	}
}
