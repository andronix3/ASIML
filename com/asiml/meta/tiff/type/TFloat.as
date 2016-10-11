package com.asiml.meta.tiff.type
{
	import flash.utils.IDataOutput;
	import flash.utils.IDataInput;

	/**
	 * @private
	 * 
	 */
	public class TFloat implements TNumber {
		private var n	:Number;
		
		public function read(fs:IDataInput):void {
			n = fs.readFloat();
		}
		
		public function write(fs:IDataOutput):void {
			fs.writeFloat(n);
		}
		
		public function toString():String {
			return n.toString();
		}
		
		public function get value() : Number {
			return n;
		}
	}
}