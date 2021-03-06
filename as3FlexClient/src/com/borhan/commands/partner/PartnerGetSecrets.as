package com.borhan.commands.partner
{
	import com.borhan.delegates.partner.PartnerGetSecretsDelegate;
	import com.borhan.net.BorhanCall;

	public class PartnerGetSecrets extends BorhanCall
	{
		public var filterFields : String;
		public function PartnerGetSecrets( partnerId : int,adminEmail : String,cmsPassword : String )
		{
			service= 'partner';
			action= 'getSecrets';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'partnerId' );
			valueArr.push( partnerId );
			keyArr.push( 'adminEmail' );
			valueArr.push( adminEmail );
			keyArr.push( 'cmsPassword' );
			valueArr.push( cmsPassword );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new PartnerGetSecretsDelegate( this , config );
		}
	}
}
