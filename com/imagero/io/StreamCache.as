package com.imagero.io
{
	import flash.filesystem.File;
	import flash.utils.ByteArray;
	import flash.utils.IDataInput;
	import flash.net.ObjectEncoding;
	
	internal class StreamCache implements IDataInput {
		
		private var proxy : StreamProxy;
		
		public function StreamCache(stream : IDataInput, tmp : File = null) {
			this.proxy = new StreamProxy(stream, tmp);
		}
		
		public function get objectEncoding():uint {
			return proxy.getObjectEncoding();
		}
		
		public function set objectEncoding(value:uint):void {
			proxy.setObjectEncoding(value);
		}
		
		public function set position(value:uint):void {
			proxy.setPosition(value);
		}
		
		public function get position():uint {
			return proxy.getPosition();
		}
		
		public function get bytesAvailable():uint {
			return proxy.getBytesAvailable();
		}
		
		public function get endian():String {
			return proxy.getEndian();
		}
		
		public function set endian(value:String):void {
			proxy.setEndian(value);
		}
		
		public function readBoolean():Boolean {
			return proxy.readBoolean();
		}
		
		public function readByte():int {
			return proxy.readByte();
		}
		
		public function readBytes(bytes:ByteArray, offset:uint = 0, length:uint = 0):void {
			return proxy.readBytes(bytes, offset, length);
		}
		
		public function readDouble():Number {
			return proxy.readDouble();
		}
		
		public function readFloat():Number {
			return proxy.readFloat();
		}
		
		public function readInt():int {
			return proxy.readInt();
		}
		
		public function readMultiByte(length:uint, charSet:String):String {
			return proxy.readMultiByte(length, charSet);
		}
		
		public function readObject():* {
			return proxy.readObject();
		}
		
		public function readShort():int {
			return proxy.readShort();
		}
		
		public function readUnsignedByte():uint {
			return proxy.readUnsignedByte();
		}
		
		public function readUnsignedInt():uint {
			return proxy.readUnsignedInt();
		}
		
		public function readUnsignedShort():uint {
			return proxy.readUnsignedShort();
		}
		
		public function readUTF():String {
			return proxy.readUTF();
		}
		
		public function readUTFBytes(length:uint):String {
			return proxy.readUTFBytes(length);
		}
		
		public function close() : void {
			proxy.close();
		}
	}
}