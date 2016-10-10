package com.imagero.meta.tiff.type
{
	import flash.utils.IDataOutput;
	import flash.utils.IDataInput;

	/**
	 * @private
	 * 
	 */
	public class TLong implements TNumber {
		private var n:int; 
		
		public function read(fs:IDataInput):void {
			n = fs.readInt();
		}
		
		public function write(fs:IDataOutput):void {
			fs.writeInt(n);
		}

		public function toString():String {
			return n.toString();
		}

		public function get value() : Number {
			return n;
		}
	}
}