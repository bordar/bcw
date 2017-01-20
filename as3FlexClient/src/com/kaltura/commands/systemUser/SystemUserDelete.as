package com.borhan.commands.systemUser
{
	import com.borhan.delegates.systemUser.SystemUserDeleteDelegate;
	import com.borhan.net.BorhanCall;

	public class SystemUserDelete extends BorhanCall
	{
		public var filterFields : String;
		public function SystemUserDelete( userId : int )
		{
			service= 'systemuser_systemuser';
			action= 'delete';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'userId' );
			valueArr.push( userId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemUserDeleteDelegate( this , config );
		}
	}
}
