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
package com.borhan.contributionWizard.model
{
	import com.borhan.contributionWizard.business.ServiceCanceller;
	import com.borhan.contributionWizard.events.NotifyShellEvent;

	[Bindable]
	public class PendingActions
	{
		public static const INITIALIZING:String 		= "INITIALIZING";
		public static const UPLOADING:String 			= "UPLOADING";
		public static const ADDING_ENTRIES:String 		= "ADDING_ENTRIES";
		public static const SEARCHING:String 			= "SEARCHING";
		public static const GETTING_MEDIA_INFO:String 	= "GETTING_MEDIA_INFO";
		public static const NONE:String 				= "NONE";


		public var serviceCanceler:ServiceCanceller;
		private var _pendingAction:String;
		private var _isPending:Boolean;

		public function setPendingAction(actionName:String, serviceCanceler:ServiceCanceller = null):void
		{
			_pendingAction = actionName;
			this.serviceCanceler = serviceCanceler;

			if (_pendingAction == NONE)
			{
				isPending = false;
			}
			else
			{
				isPending = true;
			}
		}
		public function get pendingAction():String
		{
			return _pendingAction;
		}

		public function set isPending(value:Boolean):void
		{
			_isPending = value;
			var notifyEvent:NotifyShellEvent = new NotifyShellEvent(NotifyShellEvent.PENDING);
			notifyEvent.dispatch();
		}

		public function get isPending():Boolean
		{
			return _isPending;
		}


	}
}