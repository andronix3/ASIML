package com.asiml.meta.tiff.type
{
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;

	/**
	 * @private
	 * 
	 */	
	public interface TNumber {
		function read(fs:IDataInput):void;
		function write(fs:IDataOutput):void;
		function toString():String;
		function get value() : Number;
	}
}