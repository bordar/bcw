package com.borhan.commands.metadata
{
	import com.borhan.delegates.metadata.MetadataGetDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataGet extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataGet( id : int )
		{
			service= 'metadata_metadata';
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
			delegate = new MetadataGetDelegate( this , config );
		}
	}
}
