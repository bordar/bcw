package com.borhan.commands.xInternal
{
	import com.borhan.delegates.xInternal.XInternalXAddBulkDownloadDelegate;
	import com.borhan.net.BorhanCall;

	public class XInternalXAddBulkDownload extends BorhanCall
	{
		public var filterFields : String;
		public function XInternalXAddBulkDownload( entryIds : String,flavorParamsId : String='' )
		{
			service= 'xinternal';
			action= 'xAddBulkDownload';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryIds' );
			valueArr.push( entryIds );
			keyArr.push( 'flavorParamsId' );
			valueArr.push( flavorParamsId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new XInternalXAddBulkDownloadDelegate( this , config );
		}
	}
}
