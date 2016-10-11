package com.asiml.io
{
	import flash.utils.ByteArray;
	import flash.utils.IDataInput;

	internal class BAHelper implements Helper {
		
		private var byteArray : ByteArray;
		private var fs : IDataInput;

		public function BAHelper(fs : IDataInput, byteArray : ByteArray) {
			this.fs = fs;
			this.byteArray = byteArray;
		}
		
		public function getPosition() : Number {
			return byteArray.position;
		}
		
		public function setPosition(pos : Number) : void {
			byteArray.position = pos;
		}
		
		public function close() : void {
			
		}
				
		public function checkBuffer(len : int) : void {
			with (byteArray) {
				if(bytesAvailable < len) {
					var pos : uint = position;
					position = length;
					var read : uint = Math.max(len - bytesAvailable, 2048);
					fs.readBytes(byteArray, position, read);
					position = pos;
				}
			}
		}
	}
}