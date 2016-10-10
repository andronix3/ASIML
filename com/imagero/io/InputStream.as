package com.imagero.io
{
	import flash.errors.IOError;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	import flash.utils.IDataInput;

	/**
	 * InputStream. Used to filter IDataInput. 
	 * 
	 */
	public class InputStream {
		
		protected var input : IDataInput;
		
		private var bigEndian : Boolean;
		
		public function InputStream(input : IDataInput = null) {
			this.input = input;
			if(input != null) {
				bigEndian = input.endian == Endian.BIG_ENDIAN;
			}
		}

		public function readBytes(bytes:ByteArray, offset:uint=0, length:uint=0):void {
			var len : uint = length;
			var i : uint = 0;
			while((input.bytesAvailable > 0) && (len-- > 0)) {
				bytes[offset + i++] = readByte();
			}
		}

		public function readByte():uint {
			return input.readUnsignedByte();
		}
		
		public function readShort() : uint {
			var a : uint = readByte();
			var b : uint = readByte();
			if(bigEndian) {
				return (a << 8) | b;
			}
			else {
				return (b << 8) | a;				
			}			
		}
		
		public function readInt() : uint {
			var a : uint = readByte();
			var b : uint = readByte();
			var c : uint = readByte();
			var d : uint = readByte();
			if(bigEndian) {
				return (a << 24) | (b << 16) | (c << 8) | d;
			}
			else {
				return (d << 24) | (c << 16) | (b << 8) | a;				
			}
		}
		
		public function get endian() : String {
			return input.endian;
		}
		
		public function set endian(s : String) : void {
			input.endian = s;
			bigEndian = input.endian == Endian.BIG_ENDIAN;
		}
		
		public function isPositionSupported() : Boolean {
			if(input is ByteArray) {
				return true;
			}
			else if(input is FileStream) {
				return true;
			}
			return false;
		}
		
		public function get position() : Number {
			if(input is ByteArray) {
				return ByteArray(input).position;
			}
			else if(input is FileStream) {
				return FileStream(input).position;
			}
			return -1;
		}
		
		public function set position(p : Number) : void {
			if(input is ByteArray) {
				ByteArray(input).position = p;
			}
			else if(input is FileStream) {
				FileStream(input).position = p;
			}
			else {
				throw new IOError("Unsupported");
			}
		}
	}
}