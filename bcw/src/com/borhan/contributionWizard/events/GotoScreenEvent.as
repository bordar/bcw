package com.borhan.contributionWizard.events
{
	import com.bjorn.event.ChainEvent;
	import com.borhan.contributionWizard.vo.ImportScreenVO;

	import flash.events.Event;

	public class GotoScreenEvent extends ChainEvent
	{
		public static const GOTO_SCREEN:String = "gotoScreen";

		public var importScreenVo:ImportScreenVO
		public function GotoScreenEvent(type:String, importScreenVo:ImportScreenVO, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);

			this.importScreenVo = importScreenVo;
		}

		public override function clone():Event
		{
			return new GotoScreenEvent(type, importScreenVo)
		}

	}
}