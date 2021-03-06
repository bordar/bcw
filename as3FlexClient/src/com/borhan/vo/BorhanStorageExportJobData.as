package com.borhan.vo
{
	import com.borhan.vo.BorhanStorageJobData;

	[Bindable]
	public dynamic class BorhanStorageExportJobData extends BorhanStorageJobData
	{
		public var destFileSyncStoredPath : String;
		public var force : Boolean;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('destFileSyncStoredPath');
			propertyList.push('force');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('destFileSyncStoredPath');
			arr.push('force');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('destFileSyncStoredPath');
			arr.push('force');
			return arr;
		}

	}
}
