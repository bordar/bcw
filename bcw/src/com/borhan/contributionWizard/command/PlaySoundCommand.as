/*
This file is part of the Borhan Collaborative Media Suite which allows users
to do with audio, video, and animation what Wiki platfroms allow them to do with
text.

Copyright (C) 2006-2008  Borhan Inc.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

@ignore
*/
package com.borhan.contributionWizard.command
{
	import com.adobe_cw.adobe.cairngorm.commands.ICommand;
	import com.adobe_cw.adobe.cairngorm.control.CairngormEvent;
	import com.borhan.contributionWizard.business.GetRedirectedPathDelegate;
	import com.borhan.contributionWizard.events.SoundToggleEvent;
	import com.borhan.contributionWizard.model.WizardModelLocator;
	import com.borhan.vo.importees.ImportURLVO;
	
	import mx.rpc.IResponder;

	public class PlaySoundCommand implements ICommand //, IResponder
	{
		private var _model:WizardModelLocator = WizardModelLocator.getInstance();

		public function execute(event:CairngormEvent):void
		{
			var evtSoundToggle:SoundToggleEvent = event as SoundToggleEvent;
			var importVO:ImportURLVO = evtSoundToggle.importVo;
			/*var delegate:GetRedirectedPathDelegate = new GetRedirectedPathDelegate( this );
			delegate.getRedirectedPath(importVO);*/
			_model.soundPlayer.playSound(importVO);
		}
		
		/*public function result(data:Object):void
		{
			var importVO:ImportURLVO = data as ImportURLVO;
			_model.soundPlayer.playSound(importVO);
		}
		
		public function fault(info:Object):void
		{
			
		}*/

	}
}