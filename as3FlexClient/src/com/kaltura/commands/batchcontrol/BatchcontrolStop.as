package com.borhan.commands.batchcontrol
{
	import com.borhan.delegates.batchcontrol.BatchcontrolStopDelegate;
	import com.borhan.net.BorhanCall;

	public class BatchcontrolStop extends BorhanCall
	{
		public var filterFields : String;
		public function BatchcontrolStop( schedulerId : int,schedulerName : String,targetType : int,adminId : int,adminName : String,cause : String,workerId : int=undefined,workerName : String='' )
		{
			service= 'batchcontrol';
			action= 'stop';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'schedulerId' );
			valueArr.push( schedulerId );
			keyArr.push( 'schedulerName' );
			valueArr.push( schedulerName );
			keyArr.push( 'targetType' );
			valueArr.push( targetType );
			keyArr.push( 'adminId' );
			valueArr.push( adminId );
			keyArr.push( 'adminName' );
			valueArr.push( adminName );
			keyArr.push( 'cause' );
			valueArr.push( cause );
			keyArr.push( 'workerId' );
			valueArr.push( workerId );
			keyArr.push( 'workerName' );
			valueArr.push( workerName );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BatchcontrolStopDelegate( this , config );
		}
	}
}
