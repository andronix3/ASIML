package com.asiml.meta.tiff.type
{
	import flash.utils.IDataInput
	import flash.utils.IDataOutput

	/**
	 * @private
	 * 
	 */	
	public class TShort implements TNumber {
		private var n:int;
		
		public function read(fs:IDataInput):void {
			n = fs.readShort();
		}
		
		public function write(fs:IDataOutput):void {
			fs.writeShort(n);
		}
		
		public function toString():String {
			return n.toString();
		}

		public function get value() : Number {
			return n;
		}
	}
}