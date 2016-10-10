package com.imagero.meta
{
	/**
	 * @private
	 * 
	 */
	public interface MetadataEntry {

		function get key() : String;
		function get keyDescription() : String;
		function get value() : String;
		function get valueDescription() : String;

	}
}