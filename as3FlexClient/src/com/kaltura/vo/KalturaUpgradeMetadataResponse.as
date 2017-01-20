package com.borhan.vo
{
	import com.borhan.vo.BaseFlexVo;
	[Bindable]
	public dynamic class BorhanUpgradeMetadataResponse extends BaseFlexVo
	{
		public var totalCount : int = int.MIN_VALUE;
		public var lowerVersionCount : int = int.MIN_VALUE;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('totalCount');
			propertyList.push('lowerVersionCount');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('totalCount');
			arr.push('lowerVersionCount');
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
