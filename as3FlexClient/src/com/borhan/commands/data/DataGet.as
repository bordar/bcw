package com.borhan.commands.data
{
	import com.borhan.delegates.data.DataGetDelegate;
	import com.borhan.net.BorhanCall;

	public class DataGet extends BorhanCall
	{
		public var filterFields : String;
		public function DataGet( entryId : String,version : int=-1 )
		{
			service= 'data';
			action= 'get';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			keyArr.push( 'version' );
			valueArr.push( version );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new DataGetDelegate( this , config );
		}
	}
}
