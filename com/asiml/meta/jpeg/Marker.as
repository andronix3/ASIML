package com.asiml.meta.jpeg {
	
	import flash.utils.ByteArray;
	
	/**
	 * @private
	 * 
	 */
	public class Marker {		
		internal var tag	:uint;
    	internal var length	:uint;
    	internal var data	:ByteArray
    	internal var ident	:ByteArray;
    	
    	public function Marker(tag : uint) {
    		this.tag = tag;
    	}
	}
}