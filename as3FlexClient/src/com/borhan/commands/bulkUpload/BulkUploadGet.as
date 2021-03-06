package com.borhan.commands.bulkUpload
{
	import com.borhan.delegates.bulkUpload.BulkUploadGetDelegate;
	import com.borhan.net.BorhanCall;

	public class BulkUploadGet extends BorhanCall
	{
		public var filterFields : String;
		public function BulkUploadGet( id : int )
		{
			service= 'bulkupload';
			action= 'get';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BulkUploadGetDelegate( this , config );
		}
	}
}
