package com.borhan.commands.metadataProfile
{
	import com.borhan.vo.BorhanMetadataProfile;
	import com.borhan.delegates.metadataProfile.MetadataProfileAddDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataProfileAdd extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataProfileAdd( metadataProfile : BorhanMetadataProfile,xsdData : String,viewsData : String='' )
		{
			service= 'metadata_metadataprofile';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(metadataProfile,'metadataProfile');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'xsdData' );
			valueArr.push( xsdData );
			keyArr.push( 'viewsData' );
			valueArr.push( viewsData );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataProfileAddDelegate( this , config );
		}
	}
}
