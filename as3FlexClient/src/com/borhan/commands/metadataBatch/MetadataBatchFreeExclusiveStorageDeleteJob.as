package com.borhan.commands.metadataBatch
{
	import com.borhan.vo.BorhanExclusiveLockKey;
	import com.borhan.delegates.metadataBatch.MetadataBatchFreeExclusiveStorageDeleteJobDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataBatchFreeExclusiveStorageDeleteJob extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataBatchFreeExclusiveStorageDeleteJob( id : int,lockKey : BorhanExclusiveLockKey,resetExecutionAttempts : Boolean=false )
		{
			service= 'metadata_metadatabatch';
			action= 'freeExclusiveStorageDeleteJob';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = borhanObject2Arrays(lockKey,'lockKey');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'resetExecutionAttempts' );
			valueArr.push( resetExecutionAttempts );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchFreeExclusiveStorageDeleteJobDelegate( this , config );
		}
	}
}
