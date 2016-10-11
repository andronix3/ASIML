package com.asiml.io
{
	import flash.utils.ByteArray;

	/**
	 * @private
	 * 
	 */
	 public final class ByteArray8 extends ByteArray {
		
		private var array : ByteArray;
		private var palette : Array;
		
		public function ByteArray8(array : ByteArray, palette : Array = null) {
			this.array = array;
		}
		
		override public function readUnsignedInt():uint {
			var g : uint = readUnsignedByte();
			if(palette != null) {
				return palette[g];
			}
			else {
				var a : uint = 0xFF000000;
				return a | (g << 16) | (g << 8) | g;
			}
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