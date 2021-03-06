package com.borhan.vo
{
	import com.borhan.vo.BaseFlexVo;
	[Bindable]
	public dynamic class BorhanStatsBmcEvent extends BaseFlexVo
	{
		public var clientVer : String;
		public var bmcEventActionPath : String;
		public var bmcEventType : int = int.MIN_VALUE;
		public var eventTimestamp : Number = NaN;
		public var sessionId : String;
		public var partnerId : int = int.MIN_VALUE;
		public var entryId : String;
		public var widgetId : String;
		public var uiconfId : int = int.MIN_VALUE;
		public var userId : String;
		public var userIp : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('clientVer');
			propertyList.push('bmcEventActionPath');
			propertyList.push('bmcEventType');
			propertyList.push('eventTimestamp');
			propertyList.push('sessionId');
			propertyList.push('partnerId');
			propertyList.push('entryId');
			propertyList.push('widgetId');
			propertyList.push('uiconfId');
			propertyList.push('userId');
			propertyList.push('userIp');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('clientVer');
			arr.push('bmcEventActionPath');
			arr.push('bmcEventType');
			arr.push('eventTimestamp');
			arr.push('sessionId');
			arr.push('partnerId');
			arr.push('entryId');
			arr.push('widgetId');
			arr.push('uiconfId');
			arr.push('userId');
			arr.push('userIp');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('clientVer');
			arr.push('bmcEventActionPath');
			arr.push('bmcEventType');
			arr.push('eventTimestamp');
			arr.push('sessionId');
			arr.push('partnerId');
			arr.push('entryId');
			arr.push('widgetId');
			arr.push('uiconfId');
			arr.push('userId');
			return arr;
		}

	}
}
