package com.imagero.meta.psd
{
	
	/**
	 * @private
	 * 
	 */
	public final class IRBTag {
		
		internal static const dictionary : Object = new Object();
		
		private var _tag : uint;
		private var _name : String;
		
		public function IRBTag(tag : uint, name : String) {
			_tag = tag;
			_name = name;
		}
		
		public function get tag() : uint {
			return _tag;
		}
		
		public function get name() : String {
			return _name;
		}
	}
}