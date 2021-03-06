package com.borhan.delegates.media
{
	import com.borhan.config.BorhanConfig;
	import com.borhan.core.KClassFactory;
	import com.borhan.delegates.WebDelegateBase;
	import com.borhan.errors.BorhanError;
	import com.borhan.net.BorhanCall;
	import com.borhan.net.BorhanFileCall;

	import flash.events.Event;
	import flash.net.URLLoaderDataFormat;
	import flash.utils.getDefinitionByName;

	import mx.utils.UIDUtil;

	import ru.inspirit.net.MultipartURLLoader;
	public class MediaUpdateThumbnailJpegDelegate extends WebDelegateBase
	{
		protected var mrloader:MultipartURLLoader;

		public function MediaUpdateThumbnailJpegDelegate(call:BorhanCall, config:BorhanConfig)
		{
			super(call, config);
		}

		override public function parse( result : XML ) : *
		{
			var cls : Class = getDefinitionByName('com.borhan.vo.'+ result.result.objectType) as Class;
			var obj : * = (new KClassFactory( cls )).newInstanceFromXML( result.result );
			return obj;
		}

		override protected function sendRequest():void {
			//construct the loader
			createURLLoader();

			//create the service request for normal calls
			var variables:String = decodeURIComponent(call.args.toString());
			var req:String = _config.domain +"/"+_config.srvUrl+"?service="+call.service+"&action="+call.action +'&'+variables;
			mrloader.addFile((call as BorhanFileCall).bytes, UIDUtil.createUID(), 'fileData');

			mrloader.dataFormat = URLLoaderDataFormat.TEXT;
			mrloader.load(req);
		}

		// Event Handlers
		override protected function onDataComplete(event:Event):void {
			try{
				handleResult( XML(event.target.loader.data) );
			}
			catch( e:Error )
			{
				var kErr : BorhanError = new BorhanError();
				kErr.errorCode = String(e.errorID);
				kErr.errorMsg = e.message;
				_call.handleError( kErr );
			}
		}

		override protected function createURLLoader():void {
			mrloader = new MultipartURLLoader();
			mrloader.addEventListener(Event.COMPLETE, onDataComplete);
		}

	}
}
