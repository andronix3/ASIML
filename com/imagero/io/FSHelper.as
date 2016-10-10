package com.imagero.io
{
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	import flash.utils.IDataInput;

	internal class FSHelper implements Helper {
		
		private var stream : FileStream;
		private var fs : IDataInput;

		public function FSHelper(fs : IDataInput, stream : FileStream) {
			this.fs = fs;
			this.stream = stream;
		}
		
		public function getPosition() : Number {
			return stream.position;
		}
		
		public function setPosition(pos : Number) : void {
			stream.position = pos;
		}
		
		public function close() : void {
			stream.position = 0;
			stream.truncate();
			stream.close();
		}
		
		public function checkBuffer(len : int) : void {
			with (stream) {
				if(bytesAvailable < len) {
					var pos : uint = position;
					position = length;
					var read : uint = Math.max(len - bytesAvailable, 2048);
					var tmp : ByteArray = new ByteArray();
					fs.readBytes(tmp, 0, read);
					writeBytes(tmp);
					position = pos;
				}
			}
		}
	}
}
