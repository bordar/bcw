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
package com.borhan.vo.importees
{
	import com.borhan.net.PolledFileReference;

	[Bindable]
	public class ImportFileVO extends BaseImportVO
	{

		/**
		* This file unique name.
		* Determined by the client and is used to bind between the addEntry and the upload
		*/
		public var fileName:String;

		
		/**
		 * This file uniqu server token
		 */
		public var token:String;

		/**
		* This file extension.
		* The extension must match this pattern - [filename].[extension] (e.g "Chuck_Norris.jpg")
		* Although the purpose of this property is to determine the file extension, it must include a prefix as the service requires it.
		*/
		public var fileExtension:String;

		/**
		* Upload status, valid values are "notUploaded", "uploadComplete" and "uploadFailed", these values are stored in the UploadStatusTypes class
		* added values: "uploadCanceled", "uploadIOError" and "uploadSecurityError"
		*/
		public var uploadStatus:String = UploadStatusTypes.NOT_UPLOADED;


		public var polledfileReference:PolledFileReference;
		
		/**
		* On file upload error, represents data that arrives from the server. 
		* will be used for Borhan report to help trace the problem
		*/
		public var dataOnError:String;

	}
}
