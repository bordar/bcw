package com.borhan.commands.uploadToken
{
	import com.borhan.vo.File;
	import com.borhan.delegates.uploadToken.UploadTokenUploadDelegate;
	import com.borhan.net.BorhanCall;

	public class UploadTokenUpload extends BorhanCall
	{
		public var filterFields : String;
		public function UploadTokenUpload( uploadTokenId : String,fileData : file,resume : Boolean=false,finalChunk : Boolean=true,resumeAt : int=-1 )
		{
			service= 'uploadtoken';
			action= 'upload';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'uploadTokenId' );
			valueArr.push( uploadTokenId );
 			keyValArr = borhanObject2Arrays(fileData,'fileData');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'resume' );
			valueArr.push( resume );
			keyArr.push( 'finalChunk' );
			valueArr.push( finalChunk );
			keyArr.push( 'resumeAt' );
			valueArr.push( resumeAt );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new UploadTokenUploadDelegate( this , config );
		}
	}
}
