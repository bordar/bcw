package com.borhan.commands.bulkUpload
{
	import com.borhan.delegates.bulkUpload.BulkUploadAddDelegate;
	import com.borhan.net.BorhanCall;
	
	import flash.net.FileReference;
	import flash.net.URLRequest;

	public class BulkUploadAdd extends BorhanCall
	{
		public var filterFields : String;
		private var _fr : FileReference;
		
		public function BulkUploadAdd( conversionProfileId : int, fr : FileReference )
		{
			service= 'bulkUpload';
			action= 'add';
			
			_fr = fr;
			
			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			
			keyArr.push( 'conversionProfileId' );
			valueArr.push( conversionProfileId );
			
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BulkUploadAddDelegate( this , config , _fr );
		}
	}
}
