package com.asiml.meta.tiff.type
{
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;

	/**
	 * @private
	 * 
	 */
	public class TByte implements TNumber {
		private var n:int;
		
		public function read(fs:IDataInput):void {
			n = fs.readByte();
		}
		
		public function write(fs:IDataOutput):void {
			fs.writeByte(n);
		}
		
		public function toString():String {
			return n.toString();
		}
		
		public function toHexString() : String {
			var s : String = n.toString(16);
			if(s.length == 1) {
				s = "0" + s;
			}
			return s;
		}
		
		public function get value() : Number {
			return n;
		}
	}
}