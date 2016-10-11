package com.asiml.meta.jpeg
{
	import flash.utils.IDataInput;
	
	
	/**
	 * @private
	 * 
	 */
	public interface JpegListener {
		
		function jpegRST(input : IDataInput) : void;
		
		function jpegDNL(input : IDataInput) : void;
		
		function jpegMarker(tag : uint, input : IDataInput) : void;
	}
}