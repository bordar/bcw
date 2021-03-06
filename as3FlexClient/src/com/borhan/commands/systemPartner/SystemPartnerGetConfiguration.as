package com.borhan.commands.systemPartner
{
	import com.borhan.delegates.systemPartner.SystemPartnerGetConfigurationDelegate;
	import com.borhan.net.BorhanCall;

	public class SystemPartnerGetConfiguration extends BorhanCall
	{
		public var filterFields : String;
		public function SystemPartnerGetConfiguration( partnerId : int )
		{
			service= 'systempartner_systempartner';
			action= 'getConfiguration';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'partnerId' );
			valueArr.push( partnerId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemPartnerGetConfigurationDelegate( this , config );
		}
	}
}
