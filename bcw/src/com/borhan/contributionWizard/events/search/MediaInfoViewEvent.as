package com.borhan.contributionWizard.events.search
{
	import com.borhan.contributionWizard.events.ViewControllerEvent;

	import flash.events.Event;

	public class MediaInfoViewEvent extends ViewControllerEvent
	{
		public static const MEDIA_INFO_COMPLETE:String 	= "mediaInfoComplete";
		public static const MEDIA_INFO_ERROR:String 	= "mediaInfoError";

		public var errorCode:String;

		public function MediaInfoViewEvent (type:String, token:Object = null, errorCode:String = null)
		{
			super(type, token);
			this.errorCode = errorCode;
		}

		override public function clone():Event
		{
			return new MediaInfoViewEvent(type, token, errorCode);
		}

	}
}