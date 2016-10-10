package com.imagero.io
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	import flash.utils.IDataInput;

	
	internal class StreamProxy {
		
		private var fs : IDataInput;
		private var cache : IDataInput;
		private var helper : Helper;
		
		public final function setPosition(value:uint):void {
			if(value > length) {
				checkBuffer(value - length);
			}
			helper.setPosition(value);
		}
		
		public function getPosition() : Number {
			return helper.getPosition();
		}
		
		public final function getBytesAvailable() : uint {
			if(cache.bytesAvailable == 0) {
				checkBuffer(fs.bytesAvailable);
			}
			return cache.bytesAvailable;
		}
		
		public function getEndian() : String {
			return fs.endian;
		}
		
		public function setEndian(value : String) : void {
			fs.endian = value;
			cache.endian = value;
		}
		
		public function setObjectEncoding(value : uint) : void {
			fs.objectEncoding = value;
		}
		
		public function getObjectEncoding() : uint {
			return fs.objectEncoding;
		}
		
		public function StreamProxy(fs : IDataInput, file : File) {
			this.fs = fs;
			try {
				if(file != null) {
					var cfs : FileStream = new FileStream();
					cfs.open(file, FileMode.UPDATE);
					cache = cfs;
					helper = new FSHelper(fs, cfs);
				}
			}
			catch(e : Error) {
				//ignore
			}
			finally {
				if(helper == null || cache == null) {
					var ba : ByteArray = new ByteArray();
					cache = ba;
					helper = new BAHelper(fs, ba);		
				}
			}
		}
		
		public function readBoolean():Boolean {
			checkBuffer(1);
			return cache.readBoolean();
		}
		
		public function readByte():int {
			checkBuffer(1);
			return cache.readByte();
		}
		
		public function readBytes(bytes:ByteArray, offset:uint = 0, length:uint = 0):void {
			checkBuffer(length == 0 ? fs.bytesAvailable : length);
			cache.readBytes(bytes, offset,length);
		}
		
		public function readDouble():Number {
			checkBuffer(8);
			return cache.readDouble();
		}
		
		public function readFloat():Number {
			checkBuffer(4);
			return super.readFloat();
		}
		
		public function readInt():int {
			checkBuffer(4);
			return super.readInt();
		}
		
		public function readMultiByte(length:uint, charSet:String):String {
			checkBuffer(length);
			return super.readMultiByte(length, charSet);
		}
		
		public function readObject():* {
			return super.readObject();
		}
		
		public function readShort():int {
			checkBuffer(2);
			return super.readShort();
		}
		
		public function readUnsignedByte():uint {
			checkBuffer(1);
			return super.readUnsignedByte();
		}
		
		public function readUnsignedInt():uint {
			checkBuffer(4);
			return super.readUnsignedInt();
		}
		
		public function readUnsignedShort():uint {
			checkBuffer(2);
			return super.readUnsignedShort();
		}
		
		public function readUTF():String {
			var utflen : uint = readUnsignedShort();
			return readUTFBytes(utflen);
		}
		
		public function readUTFBytes(length:uint):String {
			checkBuffer(length);
			return super.readUTFBytes(length);
		}
		
		public function close() : void {
			helper.close();
		}
		
		//todo implement 
		protected function checkBuffer(length : int) : void {
			
		}
	}
}