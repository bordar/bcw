package com.borhan.commands.conversionProfile
{
	import com.borhan.delegates.conversionProfile.ConversionProfileAddFlavorParamsDelegate;
	import com.borhan.net.BorhanCall;

	public class ConversionProfileAddFlavorParams extends BorhanCall
	{
		public var filterFields : String;
		public function ConversionProfileAddFlavorParams( conversionProfileId : int,conversionParamsId : int,readyBehavior : int=0 )
		{
			service= 'conversionProfile';
			action= 'addFlavorParams';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'conversionProfileId' );
			valueArr.push( conversionProfileId );
			keyArr.push( 'conversionParamsId' );
			valueArr.push( conversionParamsId );
			keyArr.push( 'readyBehavior' );
			valueArr.push( readyBehavior );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new ConversionProfileAddFlavorParamsDelegate( this , config );
		}
	}
}
