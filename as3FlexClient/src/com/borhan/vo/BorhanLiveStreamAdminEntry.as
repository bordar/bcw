package com.borhan.vo
{
	import com.borhan.vo.BorhanLiveStreamEntry;

	[Bindable]
	public dynamic class BorhanLiveStreamAdminEntry extends BorhanLiveStreamEntry
	{
		public var encodingIP1 : String;
		public var encodingIP2 : String;
		public var streamPassword : String;
		public var streamUsername : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('encodingIP1');
			propertyList.push('encodingIP2');
			propertyList.push('streamPassword');
			propertyList.push('streamUsername');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('encodingIP1');
			arr.push('encodingIP2');
			arr.push('streamPassword');
			arr.push('streamUsername');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('encodingIP1');
			arr.push('encodingIP2');
			arr.push('streamPassword');
			return arr;
		}

	}
}
