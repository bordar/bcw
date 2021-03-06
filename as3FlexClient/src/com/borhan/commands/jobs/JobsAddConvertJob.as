package com.borhan.commands.jobs
{
	import com.borhan.vo.BorhanBatchJob;
	import com.borhan.vo.BorhanConvertProfileJobData;
	import com.borhan.delegates.jobs.JobsAddConvertJobDelegate;
	import com.borhan.net.BorhanCall;

	public class JobsAddConvertJob extends BorhanCall
	{
		public var filterFields : String;
		public function JobsAddConvertJob( job : BorhanBatchJob,data : BorhanConvertProfileJobData )
		{
			service= 'jobs';
			action= 'addConvertJob';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(job,'job');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = borhanObject2Arrays(data,'data');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new JobsAddConvertJobDelegate( this , config );
		}
	}
}
