package com.borhan.net {
	
	import com.borhan.config.BorhanConfig;
	import com.borhan.delegates.IBorhanCallDelegate;
	import com.borhan.errors.BorhanError;
	import com.borhan.events.BorhanEvent;
	
	import flash.events.EventDispatcher;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.utils.getQualifiedClassName;
	
	public class BorhanCall extends EventDispatcher {
		
		public var args:URLVariables = new URLVariables();
		public var result:Object;
		public var error:BorhanError;
		public var config:BorhanConfig;
		public var success:Boolean = false;
		public var action : String;
		public var service : String;
		public var method : String = URLRequestMethod.POST;
		
		public var delegate : IBorhanCallDelegate;
		
		public function BorhanCall() {}
		
		//OVERRIDE this function in case something needs to be initialized prior to execution
		public function initialize():void {}
		
		//OVERRIDE this function to make init the right delegate action
		public function execute():void {}
		
		public function setRequestArgument(name:String, value:Object):void {
			if (value is Number && isNaN(value as Number)) { return; }
			if ( value is int && value == int.MIN_VALUE ) { return; }
				
			if (name && value != null ) { //&& String(value).length > 0
				this.args[name] = value;
			}
		}
		
		protected function clearRequestArguments():void {
			this.args = new URLVariables();
		}
		
		public function handleResult(result:Object):void {
			this.result = result;
			success = true;
			dispatchEvent(new BorhanEvent(BorhanEvent.COMPLETE, false, false, true, result));
		}
		/**
		 * dispatch an Error when a request has faild for any reasone  
		 * @param error
		 * 
		 */		
		public function handleError(error:BorhanError):void {
			this.error = error;
			success = false;
			error.requestArgs = args;
			dispatchEvent(new BorhanEvent(BorhanEvent.FAILED, false, false, false, null, error));
		}
		
		/**
		 * Create from prefix and borhan object an arry of key value arrays that ready to be send to the server request API 
		 * can deal with nesting objects and arrays
		 * @param any Borhan object 
		 * @prefix added before the original params to format the params to send
		 * @return Array of formated params that supported by borhan server
		 * 
		 */		
		protected function borhanObject2Arrays( obj : Object , prefix : String = null) : Array {	
			var keyValArr : Array = new Array();
			var valArray : Array = new Array();
			var keyArray : Array = new Array();
			var objArr : Array;
			var objKeys : Array;
			if(obj["getUpdatedFieldsOnly"]())
				objKeys = obj["getUpdateableParamKeys"]();
			else
				objKeys = obj["getParamKeys"]();
	
			var j:int=0;
			for (var i:int=0; i<objKeys.length; i++)
			{
				if(obj[objKeys[i].toString()] is String || obj[objKeys[i].toString()] is Number || obj[objKeys[i].toString()] is Boolean || obj[objKeys[i].toString()] is int)
				{
					keyArray[j] = prefix + ":" + objKeys[i];
					valArray[j] = obj[objKeys[i].toString()];
					++j;
				}
				else if( obj[objKeys[i].toString()] is Array)
				{
					var arr : Array = extractArray( obj[objKeys[i].toString()] , prefix + ":" + objKeys[i]);
					keyArray = keyArray.concat( arr[0] );
					valArray = valArray.concat( arr[1] );
					j = valArray.length;
				}
				else if( obj[objKeys[i].toString()] != null ) //must be a Borhan Object
				{
					objArr= getQualifiedClassName(obj[objKeys[i].toString()]).split("::");
					var tempPrefix : String = objKeys[i].toString();
					var tempKeyValArr : Array = borhanObject2Arrays( obj[objKeys[i].toString()] , prefix + ":" + tempPrefix );
					keyArray = keyArray.concat(tempKeyValArr[0]);
					valArray = valArray.concat(tempKeyValArr[1]);
					j = valArray.length;
				}
			}
			
			//adding objectType to both arrays
			keyArray[keyArray.length] = prefix + ":" + "objectType";  //add the objectType key
			objArr = getQualifiedClassName( obj ).split("::");	
			valArray[valArray.length] = objArr[objArr.length-1]; //add the objectType value	
			
			keyValArr = [ keyArray , valArray];
			return keyValArr;
		}
		
		/**
		 * Get Array and extract the objects needed to be parsed, can deal with nesting objects and arrays
		 * @param arr
		 * @return 
		 * 
		 */		
		protected function extractArray( arr : Array , prefix : String ) : Array {
			
			var keyValArr : Array = new Array();
			var keyArray : Array = new Array();
			var valArray : Array = new Array();
			var tempArr : Array;
			var j:int=0;
			for( var i:int=0; i<arr.length; i++)
			{
				var newPrefix : String = prefix+":"+i;
				if(arr[i] is String || arr[i] is Number || arr[i] is Boolean || arr[i] is int)
				{
					keyArray[j] = newPrefix;
					valArray[j] = arr[i];
					j++;
				}
				else if( arr[i] is Array ) //if this is Array
				{							
					tempArr =  extractArray( arr[i] , newPrefix);
					keyArray = keyArray.concat( tempArr[0] );
					valArray = valArray.concat( tempArr[1] );
					j = valArray.length;
				}
				else if( arr[i] != null ) //must be an object
				{
					//var objArr : Array = getQualifiedClassName(arr[i]).split("::");
					//var tempPrefix : String = objArr[objArr.length-1];
					tempArr  = borhanObject2Arrays( arr[i] , newPrefix ); //  + ":" +tempPrefix

					keyArray = keyArray.concat( tempArr[0] );
					valArray = valArray.concat( tempArr[1] );
					j = valArray.length;
				}
			}
			
			keyValArr = [ keyArray , valArray];
			return keyValArr;
		}

		
		protected function applySchema(p_shema:Array,p_args:Array):void 
		{	
			var l:uint = p_shema.length;
			
			for (var i:uint=0;i<l;i++) {
				setRequestArgument(p_shema[i], p_args[i]);
			}
		}
	}
}