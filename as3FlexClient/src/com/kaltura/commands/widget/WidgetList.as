package com.borhan.commands.widget
{
	import com.borhan.vo.BorhanWidgetFilter;
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.widget.WidgetListDelegate;
	import com.borhan.net.BorhanCall;

	public class WidgetList extends BorhanCall
	{
		public var filterFields : String;
		public function WidgetList( filter : BorhanWidgetFilter=null,pager : BorhanFilterPager=null )
		{
			if(filter== null)filter= new BorhanWidgetFilter();
			if(pager== null)pager= new BorhanFilterPager();
			service= 'widget';
			action= 'list';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(filter,'filter');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = borhanObject2Arrays(pager,'pager');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new WidgetListDelegate( this , config );
		}
	}
}
