package com.borhan.contributionWizard.command
{

	import com.adobe_cw.adobe.cairngorm.commands.ICommand;
	import com.adobe_cw.adobe.cairngorm.control.CairngormEvent;
	import com.borhan.contributionWizard.business.ReportErrorDelegate;
	import com.borhan.contributionWizard.events.ReportErrorEvent;
	import com.borhan.contributionWizard.model.WizardModelLocator;
	
	import flash.system.Capabilities;
	
	import mx.rpc.IResponder;

	public class ReportErrorCommand implements ICommand, IResponder
	{
		private var _model:WizardModelLocator = WizardModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void
		{
			var e : ReportErrorEvent = event as ReportErrorEvent;
			
			//add defualt params to the description
			e.errorVo.errorDescription += "&type="+e.type;
			e.errorVo.errorDescription = addDefaults( e.errorVo.errorDescription );
			
			var delegate : ReportErrorDelegate = new ReportErrorDelegate( this ); 
			delegate.reportError( e.errorVo );
		}

		public function result(data:Object):void
		{
			trace("ReportErrorCommand==>result");
		}
		
		public function fault(info:Object):void
		{
			trace("ReportErrorDelegate==>fault");
		}	
		
		private function addDefaults( str : String ) : String
		{
			str += "&BCWSessionId=" + _model.context.bcwSessionId;
			str += "&FlashVersion=" + Capabilities.version;
			str += "&os=" + Capabilities.os;
			str += "&playerType=" + Capabilities.playerType;
			str += "&partnerId=" + _model.context.partnerId;  
			return str;
		}
	}
}