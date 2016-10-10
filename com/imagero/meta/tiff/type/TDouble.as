package com.imagero.meta.tiff.type
{
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;

	/**
	 * @private
	 * 
	 */
	 public class TDouble implements TNumber {
		private var n :Number;
		
		public function read(fs:IDataInput):void {
			n = fs.readDouble();
		}
		
		public function write(fs:IDataOutput):void {
			fs.writeDouble(n);
		}

		public function toString():String {
			return n.toString();
		}
		
		public function get value() : Number {
			return n;
		}
	}
}