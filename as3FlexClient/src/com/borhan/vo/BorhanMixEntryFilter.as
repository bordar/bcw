package com.borhan.vo
{
	import com.borhan.vo.BorhanPlayableEntryFilter;

	[Bindable]
	public dynamic class BorhanMixEntryFilter extends BorhanPlayableEntryFilter
	{
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			return arr;
		}

	}
}
