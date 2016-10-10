package com.imagero.meta.tiff.type
{
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;

	/**
	 * @private
	 * 
	 */
	public class TRational implements TNumber {
		private var _numerator	:uint;
		private var _denominator	:uint;
		
		public function read(fs:IDataInput):void {
			_numerator = fs.readInt();
			_denominator = fs.readInt();
		}
		
		public function write(fs:IDataOutput):void {
			fs.writeInt(_numerator);
			fs.writeInt(_denominator);			
		}

		public function toString():String {
			return _numerator.toString() + "/" + _denominator.toString();
		}

		public function get value() : Number {
			return _numerator / _denominator;
		}
		
		public function get numerator() : Number {
			return _numerator;
		}
		
		public function get denominator() : Number {
			return _denominator;
		}
	}
}