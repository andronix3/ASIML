package com.imagero.io
{
	import flash.utils.ByteArray;

	/**
	 * @private
	 * 
	 */
	public class ByteArray24 extends ByteArray {
		
		private var array : ByteArray;
		
		public function ByteArray24(array : ByteArray) {
			this.array = array;
		}
		
		override public function readUnsignedInt():uint {
			var a : uint = 0xFF;
			a = (a << 8) | readUnsignedByte();
			a = (a << 8) | readUnsignedByte();
			a = (a << 8) | readUnsignedByte();
			return a;
		}
		
		override public function get position() : uint {
			return array.position;
		}
		
		override public function get bytesAvailable():uint {
			return array.bytesAvailable;
		}
		
		override public function readByte():int {
			return array.readByte();
		}
		
		override public function readUnsignedByte():uint {
			return array.readUnsignedByte();
		}
	}
}