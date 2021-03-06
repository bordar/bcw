package com.borhan.commands.user
{
	import com.borhan.delegates.user.UserDeleteDelegate;
	import com.borhan.net.BorhanCall;

	public class UserDelete extends BorhanCall
	{
		public var filterFields : String;
		public function UserDelete( userId : String )
		{
			service= 'user';
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
			delegate = new UserDeleteDelegate( this , config );
		}
	}
}
