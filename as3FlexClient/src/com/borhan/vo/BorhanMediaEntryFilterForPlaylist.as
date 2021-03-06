package com.borhan.vo
{
	import com.borhan.vo.BorhanMediaEntryFilter;

	[Bindable]
	public dynamic class BorhanMediaEntryFilterForPlaylist extends BorhanMediaEntryFilter
	{
		public var limit : int = int.MIN_VALUE;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('limit');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('limit');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('limit');
			return arr;
		}

	}
}
