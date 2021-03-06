package com.borhan.commands.baseEntry
{
	import com.borhan.vo.BorhanBaseEntry;
	import com.borhan.delegates.baseEntry.BaseEntryAddFromUploadedFileDelegate;
	import com.borhan.net.BorhanCall;

	public class BaseEntryAddFromUploadedFile extends BorhanCall
	{
		public var filterFields : String;
		public function BaseEntryAddFromUploadedFile( entry : BorhanBaseEntry,uploadTokenId : String,type : int=-1 )
		{
			service= 'baseentry';
			action= 'addFromUploadedFile';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(entry,'entry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'uploadTokenId' );
			valueArr.push( uploadTokenId );
			keyArr.push( 'type' );
			valueArr.push( type );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BaseEntryAddFromUploadedFileDelegate( this , config );
		}
	}
}
