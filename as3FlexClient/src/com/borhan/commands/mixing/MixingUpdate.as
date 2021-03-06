package com.borhan.commands.mixing
{
	import com.borhan.vo.BorhanMixEntry;
	import com.borhan.delegates.mixing.MixingUpdateDelegate;
	import com.borhan.net.BorhanCall;

	public class MixingUpdate extends BorhanCall
	{
		public var filterFields : String;
		public function MixingUpdate( entryId : String,mixEntry : BorhanMixEntry )
		{
			service= 'mixing';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
 			keyValArr = borhanObject2Arrays(mixEntry,'mixEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MixingUpdateDelegate( this , config );
		}
	}
}
