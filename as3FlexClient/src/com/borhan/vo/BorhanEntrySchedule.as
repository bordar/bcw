package com.borhan.vo
{
	import com.borhan.vo.BaseFlexVo;
	public dynamic class BorhanEntrySchedule extends BaseFlexVo
	{
		public var id : int = int.MIN_VALUE;
		public var partnerId : int = int.MIN_VALUE;
		public var startDate : int = int.MIN_VALUE;
		public var endDate : int = int.MIN_VALUE;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('id');
			propertyList.push('partnerId');
			propertyList.push('startDate');
			propertyList.push('endDate');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('id');
			arr.push('partnerId');
			arr.push('startDate');
			arr.push('endDate');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('startDate');
			arr.push('endDate');
			return arr;
		}

	}
}
