package com.borhan.contributionWizard.vo
{
	import com.borhan.vo.BorhanCategory;
	
	import mx.collections.ArrayCollection;
	
	public class CategoryVO
	{
		public var id:Number;
		[Bindable]public var name:String;
		public var category:BorhanCategory;
		public var children:ArrayCollection = new ArrayCollection();
		
		
		public function CategoryVO(id:Number, name:String, category:BorhanCategory)
		{
			this.id = id;
			this.name = name;
			this.category = category;
		}
		
		public function clone():CategoryVO
		{
			var clonedVo:CategoryVO = new CategoryVO(-1, '', null);
			
			clonedVo.name = this.name;
			clonedVo.id = this.id;
			
			clonedVo.category = new BorhanCategory();
			clonedVo.category.createdAt = this.category.createdAt;
			clonedVo.category.depth = this.category.depth;
			clonedVo.category.entriesCount = this.category.entriesCount;
			clonedVo.category.fullName = this.category.fullName;
			clonedVo.category.id = this.category.id;
			clonedVo.category.name = this.category.name;
			clonedVo.category.parentId = this.category.parentId;
			clonedVo.category.partnerId = this.category.partnerId;
			
			return clonedVo;
		}

	}
}